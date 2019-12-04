<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar custome-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <!-- /.search form -->
        <!-- Sidebar Menu -->
        <ul class="sidebar-menu fanlyfe-menu">
             {{-- Dashboaard--}}
            <li class="treeview">
                <a href="{{ url('admin/') }}"><i class="fa fa-home font-color" aria-hidden="true"></i><span>Dashboard{{--{{ trans('adminlte_lang::message.multilevel') }}--}}</span></a>
            </li>

            <li class="treeview">
                <a href="{{ url('admin/users_lists/') }}"><i class="fa fa-home font-color" aria-hidden="true"></i><span>Sellers & Buyers Profile</span></a>
            </li>

            <li class="treeview">
                <a href="{{ url('admin/products_lists/') }}"><i class="fa fa-cart-plus font-color" aria-hidden="true"></i><span> Products </span></a>
            </li>

            <li class="treeview">
                <a href="{{ url('admin/get_orders/') }}"><i class="fa fa-cart-plus font-color" aria-hidden="true"></i><span> Orders </span></a>
            </li>

            <li class="treeview">
                <a href="{{ url('admin/support_center/') }}"><i class="fa fa-cart-plus font-color" aria-hidden="true"></i><span> Support Center </span></a>
            </li>



            {{-- Reports--}}
            <li class="treeview">
                <a href="{{ url('logout')  }}"><i class="fa fa-sign-out font-color" aria-hidden="true"></i><span>Logout{{--{{ trans('adminlte_lang::message.multilevel') }}--}}</span></a>
            </li>
        </ul>
        <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>
