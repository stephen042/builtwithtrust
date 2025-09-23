<?php

$pageName = "Funds Withdrawal";
include("../include/vendor/autoload.php");
include_once("layouts/header.php");
//require_once("../include/userFunction.php");
//require_once('../include/userClass.php');


$email = $row['acct_email'];
$fullName = $row['lastname'] . ' ' . $row['firstname'];

if (isset($_POST['withdrawal-submit'])) {
    $amount = $_POST['amount'];
    $withdraw_method = $_POST['withdraw_method'];
    $wallet_address = $_POST['wallet_address'];
    $acct_id = userDetails('id');

    // Check if any of the required fields are empty
    if (empty($amount) || empty($withdraw_method) || empty($wallet_address)) {
        notify_alert('Fill Required Form', 'danger', '3000', 'Close');
    }

    if ($acct_id) {
        // Check if account is on hold
        if ($acct_stat === 'hold') {
            toast_alert('error', 'Account on Hold Contact Support for more info');
        } elseif ($amount < 0) {
            toast_alert('error', 'Invalid amount entered');
        } elseif ($amount < $trans_limit_min) {
            toast_alert('error', 'Amount Less than withdraw Limit');
        } elseif ($amount > $trans_limit_max) {
            toast_alert('error', 'Amount greater than withdraw Limit');
        } else {
            // Start a transaction to ensure atomicity
            $conn->beginTransaction();

            try {
                // Generate a unique reference ID
                $reference_id = uniqid();

                // Prepare the SQL statement with placeholders
                $withdrawal = "INSERT INTO withdrawal (reference_id, user_id, amount, withdraw_method, wallet_address) 
                               VALUES(:reference_id, :user_id, :amount, :withdraw_method, :wallet_address)";

                // Prepare the statement for insertion
                $stmt = $conn->prepare($withdrawal);

                // Bind parameters to prevent SQL injection
                $stmt->bindParam(':reference_id', $reference_id, PDO::PARAM_STR);
                $stmt->bindParam(':user_id', $acct_id, PDO::PARAM_INT);
                $stmt->bindParam(':amount', $amount, PDO::PARAM_INT);
                $stmt->bindParam(':withdraw_method', $withdraw_method, PDO::PARAM_STR);
                $stmt->bindParam(':wallet_address', $wallet_address, PDO::PARAM_STR);

                // Execute the withdrawal insertion
                if ($stmt->execute()) {
                    // Deduct the amount from the user's account balance
                    $update_balance = "UPDATE users SET acct_balance = acct_balance - :amount WHERE id = :user_id";

                    // Prepare the statement for balance update
                    $stmt_balance = $conn->prepare($update_balance);
                    $stmt_balance->bindParam(':amount', $amount, PDO::PARAM_INT);
                    $stmt_balance->bindParam(':user_id', $acct_id, PDO::PARAM_INT);

                    // Execute the balance update
                    if ($stmt_balance->execute()) {
                        // Commit the transaction if both operations are successful
                        $conn->commit();

                        // Send a confirmation email
                        $APP_NAME = $pageTitle;
                        $message = $sendMail->withdarwalMsg($fullName, $amount, $withdraw_method, $wallet_address, $reference_id, $APP_NAME);
                        $subject = "[WITHDRAWAL] - $APP_NAME";
                        $email_message->send_mail($email, $message, $subject);

                        toast_alert("success", "Your Withdrawal Transaction Request is on Process", "Thanks!");
                    } else {
                        // If balance update fails, rollback transaction
                        $conn->rollBack();
                        toast_alert("error", "Sorry, something went wrong while updating your balance.");
                    }
                } else {
                    // If withdrawal insertion fails, rollback transaction
                    $conn->rollBack();
                    toast_alert("error", "Sorry, something went wrong with your withdrawal request.");
                }
            } catch (Exception $e) {
                // If any error occurs during the transaction, rollback and display the error
                $conn->rollBack();
                toast_alert("error", "Error: " . $e->getMessage());
            }
        }
    }
}





?>

<div id="content" class="main-content">
    <div class="layout-px-spacing">

        <div class="row layout-top-spacing">
            <div class="col-md-8 offset-md-2">
                <div class="card component-card">
                    <div class="card-body">
                        <div class="user-profile">
                            <div class="row">
                                <div class="col-md-12">
                                    <?php
                                    if ($acct_stat === 'active') {
                                    ?>
                                        <form method="POST">
                                            <div class="form-group mb-4 mt-4">
                                                <label for="">Amount</label>
                                                <div class="input-group ">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon1"><svg
                                                                xmlns="http://www.w3.org/2000/svg" width="24"
                                                                height="24" viewBox="0 0 24 24" fill="none"
                                                                stroke="currentColor" stroke-width="2"
                                                                stroke-linecap="round" stroke-linejoin="round"
                                                                class="feather feather">
                                                                <line x1="12" y1="1"
                                                                    x2="12"
                                                                    y2="23"></line>
                                                                <path
                                                                    d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                                                            </svg></span>
                                                    </div>

                                                    <input type="number" class="form-control" name="amount" placeholder="Amount"
                                                        aria-label="notification" aria-describedby="basic-addon1">
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">

                                                    <div class="form-group mb-4 mt-4">
                                                        <label for="">Crypto Type</label>
                                                        <div class="input-group">
                                                            <select name="withdraw_method" class='selectpicker' data-width='100%'>
                                                                <option>Select</option>
                                                                <?php
                                                                $sql = $conn->query("SELECT * FROM crypto_currency ORDER BY crypto_name");
                                                                while ($rs = $sql->fetch(PDO::FETCH_ASSOC)) {
                                                                    $data[] = array(
                                                                        'id' => $rs['id'],
                                                                        'wallet_address' => $rs['wallet_address']
                                                                    );
                                                                ?>
                                                                    <option value="<?= ucwords($rs['crypto_name'])  ?>"><?= ucwords($rs['crypto_name']) ?></option>
                                                                <?php
                                                                }
                                                                ?>
                                                            </select>




                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group mb-4 mt-4">
                                                        <label for="">Wallet Address</label>
                                                        <div class="input-group ">
                                                            <input type="text" class="form-control" name="wallet_address" id="wallet_address" placeholder="Wallet Address"
                                                                aria-label="notification" aria-describedby="basic-addon1">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 text-center">
                                                    <button class="btn btn-primary mb-2 mr-2" name="withdrawal-submit"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out">
                                                            <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                                            <polyline points="16 17 21 12 16 7"></polyline>
                                                            <line x1="21" y1="12" x2="9" y2="12"></line>
                                                        </svg> Request</button>
                                                </div>
                                            </div>
                                </div>

                                </form>
                            </div>
                        <?php
                                    } else {
                        ?>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="alert custom-alert-1 mb-4 bg-danger border-danger" role="alert">

                                        <div class="media">
                                            <div class="alert-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-alert-circle">
                                                    <circle cx="12" cy="12" r="10"></circle>
                                                    <line x1="12" y1="8" x2="12" y2="12"></line>
                                                    <line x1="12" y1="16" x2="12" y2="16"></line>
                                                </svg>
                                            </div>
                                            <div class="media-body">
                                                <div class="alert-text">
                                                    <strong>Warning! </strong><span> Account on <span class="text-uppercase "><b>hold</b></span> contact support.</span>
                                                </div>
                                                <div class="alert-btn">
                                                    <a class="btn btn-default btn-dismiss" href="mailto:<?= $url_email ?>">Contact Us</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php
                                    }
                    ?>

                    </div>
                </div>
            </div>
            <hr style="border: 1px solid grey;">
        </div>

    </div>
    <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
        <div class="widget-content widget-content-area br-6">
            <h3>Withdrawals </h3>
            <table id="default-ordering" class="table table-hover" style="width:100%">

                <thead>
                    <tr>
                        <th>S/N</th>
                        <th>Amount</th>
                        <th>Reference ID</th>
                        <th>Wallet Address</th>
                        <th>Method</th>
                        <th>Status</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>


                    <?php

                    function status($data)
                    {
                        if ($data['status'] == '0') {
                            return '<span class="badge outline-badge-secondary shadow-none col-md-12">In Progress</span>';
                        }
                        if (
                            $data['status'] == '2'
                        ) {
                            return  '<span class="badge outline-badge-danger shadow-none col-md-12">Hold</span>';
                        }

                        if (
                            $data['status'] == '3'
                        ) {
                            return '<span class="badge outline-badge-danger shadow-none col-md-12">Cancelled</span>';
                        }

                        if (
                            $data['status'] == '1'
                        ) {
                            return '<span class="badge outline-badge-success shadow-none col-md-12">APPROVED</span>';
                        }
                    }

                    $sql = "SELECT * FROM withdrawal WHERE user_id =:acct_id ORDER BY id DESC";
                    $stmt = $conn->prepare($sql);
                    $stmt->execute([
                        'acct_id' => $acct_id
                    ]);

                    $sn = 1;

                    while ($result = $stmt->fetch(PDO::FETCH_ASSOC)) {

                    ?>
                        <tr>
                            <td><?= $sn++ ?></td>
                            <td><?= $currency . $result['amount'] ?></td>
                            <td><?= $result['reference_id'] ?></td>
                            <td><?= $result['wallet_address'] ?></td>
                            <td><?= $result['withdraw_method'] ?></td>
                            <td>
                                <?php
                                echo status($result);
                                ?>
                            </td>
                            <td><?= date('Y-m-d H:i a', strtotime($result['createdAt'])) ?></td>


                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th>S/N</th>
                        <th>Amount</th>
                        <th>Trans ID</th>
                        <th>Wallet Address</th>
                        <th>Status</th>
                        <th>Date</th>
                    </tr>
                </tfoot>
            </table>
        </div>



    </div>

    <?php
    include_once('layouts/fixedFooter.php')
    ?>
    <?php
    include_once('layouts/footer.php')
    ?>