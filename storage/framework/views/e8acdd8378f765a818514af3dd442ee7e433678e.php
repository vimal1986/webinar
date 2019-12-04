<?php $__env->startPush('styles'); ?>
  <link href="<?php echo e(asset('css/dashboard.css')); ?>?4" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    
  <link href="<?php echo e(asset('css/vectorcss/jquery-jvectormap.css')); ?>" rel="stylesheet" type="text/css">
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="add-team">
                <div class="row">
                    <div class="col-sm-12">

                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3><?php echo e(\App\Order::all()->count()); ?></h3>

                                    <p>New Orders</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-bag"></i>
                                </div>
                                <a href="<?php echo e(url('admin/get_orders')); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3>
                                          <?php echo e(\App\User::all()->count()); ?>

                                    </h3>
                                    <p>User Registrations</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-person-add"></i>
                                </div>
                                <a href="<?php echo e(url('admin/users_lists')); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3>
                                        <?php echo e(\App\Product::all()->count()); ?>

                                    </h3>
                                    <p>Products</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-ios-cart"></i>
                                </div>
                                <a href="<?php echo e(url('admin/products)lists')); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>

                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3><?php echo e(\App\Order::sum('amount')); ?><sup style="font-size: 20px"></sup></h3>

                                    <p>Sales</p>
                                </div>
                                <div class="icon">
                                    <i class="ion ion-stats-bars"></i>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>

                    </div>
                </div>


            </div>

            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Recent Orders</h3>

                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">

                        <table class="table" id="example">
                            <tr>
                                <th style="width: 10px">#Id</th>
                                <th colspan="2" style="text-align: center">Product </th>
                                <th>Date</th>
                                <th>Buyer</th>
                                <th>Seller</th>
                                <th>Amount</th>
                                <th>Details</th>
                            </tr>
                            <tbody>
                            <?php
                            $i=1;
                            ?>
                            <?php $__currentLoopData = $orders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $list): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td ><?php echo e($list->id); ?></td>
                                    <td><img src="<?php echo e($list->img_url); ?>" width="50" class="img-responsive" /></td>
                                    <td><?php echo e($list->product_title); ?></td>
                                    <td><?php echo e(date('d/m/Y' , strtotime($list->purchase_date))); ?></td>
                                    <td><a href="<?php echo e(URL('admin/user_profile/'.$list->buyer_id)); ?>"><?php echo e($list->buyer_name); ?></a></td>
                                    <td><a href="<?php echo e(URL('admin/user_profile/'.$list->seller_id)); ?>"><?php echo e($list->seller_name); ?></a></td>
                                    <td><?php echo e($list->order_amount); ?></td>
                                    <td>
                                        <span class="badge bg-green">
                                            <a href="<?php echo e(url('admin/order_view/' . $list->id)); ?>" style="color: white;" > View Order </a>
                                        </span>
                                    </td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                            </tbody>
                        </table>

                    </div>
                    <!-- /.box-body -->
                </div>
            </div>


            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Recent Products</h3>

                    </div>
                    <!-- /.box-header -->
                    <div class="box-body no-padding">

                        <table class="table" id="example">
                            <tr>
                                <th>Product Id</th>
                                <th>Image</th>
                                <th>Title</th>
                                <th>Retial Price</th>
                                <th>Offer price</th>
                                <th>Handle Name</th>
                                <th>Posted at</th>
                                <th>View</th>
                            </tr>
                            <tbody>

                            <?php
                            $i=1;
                            ?>

                            <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $list): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <tr>
                                    <td><?php echo e($i++); ?></td>
                                    <td><img src="<?php echo e($list->img_url); ?>" width="50" class="img-responsive"></td>
                                    <td><?php echo e($list->product_title); ?></td>
                                    <td><?php echo e($list->price); ?></td>
                                    <td><?php echo e($list->discount_price); ?></td>
                                    <td><a href="<?php echo e(URL::to('admin/user_profile/'.$list->user_id)); ?>"><?php echo e('@'.$list->handle_name); ?></a></td>
                                    <td><?php echo e(date('d/m/Y' , strtotime($list->created_at))); ?></td>
                                    <td>
                                        <span class="badge bg-green" >
                                        <a href="<?php echo e(URL::to('admin/product_details/' . $list->id)); ?>" style="color:white;"> details>> </a>
                                        </span>
                                    </td>
                                </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>

                        </table>

                    </div>
                    <!-- /.box-body -->
                </div>
                <div class="clearfix"></div>
                <br><br>
            </div>


        </div>
    </div>
    <?php $__env->startPush('map-scripts'); ?>
    
    <script src="<?php echo e(asset('js/vectorjs/jquery-jvectormap-1.2.2.min.js')); ?>"></script>
    <script src="<?php echo e(asset('js/vectorjs/jquery-jvectormap-world-mill-en.js')); ?>"></script>
    <script src="<?php echo e(asset('js/vectorjs/customemap.js')); ?>"></script>
    <?php $__env->stopPush(); ?>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.partials.dashboard', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>