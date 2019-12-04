<?php $__env->startPush('styles'); ?>
    <!-- Bootstrap CSS -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo e(asset('css/user-list.css')); ?>">
    <link rel="stylesheet" href="<?php echo e(URL('plugins/datepicker/datepicker3.css')); ?>">
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <div id="page-wrapper" class="list-blade">
        <div class="container-fluid">
            <div class="user-list">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2>Complaints</h2>
                    </div>


                    <div class="panel-body">

                        <div class="clearfix"></div>

                        <form class="form-inline">
                            <div class="form-group">
                                <label>From</label>
                                <input type="text" name="from_date" class="form-control datepicker" >
                            </div>
                            <div class="form-group">
                                <label>To</label>
                                <input type="text" name="to_date" class="form-control datepicker" >
                            </div>
                            <div class="form-group">
                                <input type="submit" value="FILTER" class="btn btn-success" />
                            </div>
                        </form>

                        <br>

                        <div class="clearfix"></div>

                        <div class="table-responsive">
                            <table class="table table-bordered" id="example">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Order Id</th>
                                    <th>User</th>
                                    <th>Subject</th>
                                    <th>Message</th>
                                    <th>Raised At</th>
                                </tr>
                                </thead>
                                <tbody>

                                <?php $__currentLoopData = $complaints; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $list): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td><?php echo e($list->id); ?></td>
                                        <td><a href="<?php echo e(URL('admin/order_view/'.$list->order_id)); ?>"><?php echo e('#0'.$list->order_id); ?></a></td>
                                        <td><a href="<?php echo e(URL('admin/user_profile/'.$list->user_id)); ?>"><?php echo e('@'.$list->handle_name); ?></a></td>
                                        <td><?php echo e($list->subject); ?></td>
                                        <td><?php echo e($list->message); ?></td>
                                        <td><?php echo e(date('d/m/Y' , strtotime($list->created_at))); ?></td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
    <!-- DataTables -->
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
    <!-- App scripts -->
    <script src="<?php echo e(url('plugins/datepicker/bootstrap-datepicker.js')); ?>"></script>

    <script>
        $(document).ready(function() {
            $('#example').DataTable();
        } );

        $('.datepicker').datepicker({
            format : 'dd-mm-yyyy'
        });
    </script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('layouts.partials.dashboard', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>