<?php $__env->startPush('styles'); ?>
    <!-- Bootstrap CSS -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="<?php echo e(asset('css/user-list.css')); ?>">
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <div id="page-wrapper" class="profile-info">
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2>Profile Info</h2>
                </div>
                <div class="panel-body">
                    <section class="profile">
                        <div class="row">
                            <div class="col-md-3">
                                <dl class="profile-img">
                                    <div class="middle">
                                    <?php if($user->profile_image): ?>
                                        <img src="<?php echo e(url('uploads/profile_image/'.$user->profile_image)); ?>" alt="profile image" />
                                    <?php else: ?>
                                        <img  src="<?php echo e(url('image/user_image.png')); ?>" alt="profile image"/>
                                    <?php endif; ?>
                                    </div>
                                </dl>
                            </div>
                            <div class="col-md-4">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label class="control-label col-sm-4" for="email">Firstname:</label>
                                                <div class="col-sm-8">
                                                    <?php echo e($user->first_name); ?>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4" for="pwd">Lastname:</label>
                                                <div class="col-sm-8">
                                                    <?php echo e($user->last_name); ?>

                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4" for="pwd">Registeration Date:</label>
                                                <div class="col-sm-8">
                                                    <?php echo e($user->created_at); ?>

                                                </div>
                                            </div>
                                        </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="control-label col-sm-4" for="pwd">Email:</label>
                                            <div class="col-sm-8">
                                                <span><?php echo e($user->email); ?></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-4" for="pwd">Handle:</label>
                                            <div class="col-sm-8">
                                                <?php echo e('@'.$user->handle_name); ?>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <form method="post" action="<?php echo e(url('admin/delete_user')); ?>" >
                                                <input type="hidden" name="_token" value="<?php echo e(csrf_token()); ?>">
                                                <input type="hidden" name="user_id" value="<?php echo e($user->id); ?>" />
                                                <button value="MOVE TO TRASH" class="btn btn-danger"><i class="fa fa-fw fa-trash"></i>MOVE TO TRASH</button>
                                            </form>
                                        </div>

                                </div>
                            </div>
                        </div>

                    </section>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2>Products</h2>
                </div>

                <div class="panel-body">
                    <div class="clearfix"></div>
                    <section class="products">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="example">
                                <thead>
                                <tr>
                                    <th>Product Id</th>
                                    <th>Title</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Discounted price</th>
                                    <th>View</th>
                                </tr>
                                </thead>
                                <tbody>

                                    <?php
                                       $i=1;
                                       $products = $user->products()->get();
                                    ?>

                                    <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $list): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <tr>
                                            <td><?php echo e($i++); ?></td>
                                            <td><?php echo e($list->product_title); ?></td>
                                            <td><?php echo e($list->product_description); ?></td>
                                            <td><?php echo e($list->price); ?></td>
                                            <td><?php echo e($list->discount_price); ?></td>
                                            <td> <a href="<?php echo e(URL::to('admin/product_details/' . $list->id)); ?>">View</a> </td>
                                        </tr>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                </tbody>
                            </table>
                        </div>
                    </section>
                    <div class="clearfix"></div>
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
    <script>
        $(document).ready(function() {
            $('#example').DataTable();
        } );
    </script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.partials.dashboard', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>