
    <div class="error-page">
        <h2 class="headline text-yellow"> 404</h2>
        <div class="error-content">
            <h3><i class="fa fa-warning text-yellow"></i> Oops! <?php echo e(trans('adminlte_lang::message.pagenotfound')); ?>.</h3>
            <p>
                <?php echo e(trans('adminlte_lang::message.notfindpage')); ?>

                <?php echo e(trans('adminlte_lang::message.mainwhile')); ?> <a href='<?php echo e(url('/home')); ?>'><?php echo e(trans('adminlte_lang::message.returndashboard')); ?></a> <?php echo e(trans('adminlte_lang::message.usingsearch')); ?>

            </p>
            <form class='search-form'>
                <div class='input-group'>
                    <input type="text" name="search" class='form-control' placeholder="<?php echo e(trans('adminlte_lang::message.search')); ?>"/>
                    <div class="input-group-btn">
                        <button type="submit" name="submit" class="btn btn-warning btn-flat"><i class="fa fa-search"></i></button>
                    </div>
                </div><!-- /.input-group -->
            </form>
        </div><!-- /.error-content -->
    </div><!-- /.error-page -->
