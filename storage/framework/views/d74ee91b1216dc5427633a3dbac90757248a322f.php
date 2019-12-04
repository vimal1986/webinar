<?php $__env->startPush('styles'); ?>
<link href="<?php echo e(asset('css/addleague.css')); ?>?4" rel="stylesheet" type="text/css">
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>
    <div id="page-wrapper" class="add-deal">
        <div class="container-fluid">
            <div class="add-leguage">
                <div class="row">
                    <div class="col-sm-12">
                        <?php if($errors->any()): ?>
                            <div class="alert alert-danger hide-alert-message">
                                <ul>
                                    <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <li><?php echo e($error); ?></li>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </ul>
                            </div>
                        <?php endif; ?>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <label for="add-league">Add League</label>
                            </div>
                            <div class="panel-body">
                                <form action="<?php echo e(url('admin/set_league')); ?>" class="form-horizontal" method="post" id="leagueForm">
                                    <div class="center-align">
                                        <label class="control-label col-sm-2" for="email">League:</label>
                                        <div class="col-sm-10 padding-remove">
                                                    <div class="">
                                                        <input type="text" class="form-control" name="league" id="league">
                                                        <input type="hidden" name="_token" id="csrf_token" value="<?php echo e(csrf_token()); ?>">
                                                        <p class="error-msg"></p>
                                                    </div>
                                            <div class="add-league-btn">
                                                <button type="submit" class="btn btn-success btn-md btn-block">ADD LEAGUE</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="data-table">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <label for="add-league">Leagues List</label>
                    </div>
                    <div class="panel-body">
                        <div class="add-league-table">
                            <?php echo $__env->make('league/partials/dataTable', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php $__env->startPush('scripts'); ?>
    <script src="<?php echo e(asset('js/validation/common-script.js')); ?>"></script>
    <script src="<?php echo e(asset('js/validation/validate.js')); ?>"></script>
    <?php $__env->stopPush(); ?>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.partials.dashboard', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>