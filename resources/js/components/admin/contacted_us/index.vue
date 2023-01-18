<script setup>
    import Sidebar from '../layouts/sidebar.vue'
    import TopNavigation from '../layouts/topNavigation.vue'
    import Footer from '../layouts/footer.vue'
</script>
<template>
    <div class="nav-md">
        <div class="container body">
            <div class="main_container">
                <!-- Sidebar -->
                <Sidebar />
                <!-- Sidebar -->

                <!-- top navigation -->
                <TopNavigation />
                <!-- /top navigation -->

                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h3>Contacted Us <small>Listing</small> </h3>
                            </div>

                            <div class="title_right">
                                <div class="col-md-10 col-sm-10   form-group pull-right top_search">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search for...">
                                        <span class="input-group-btn">
                                            <button class="btn btn-secondary" type="button">Go!</button>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>All Contacted Us</h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li>
                                                <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                            </li>

                                            <li>
                                                <a class="close-link"><i class="fa fa-close"></i></a>
                                            </li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <!-- start project list -->
                                        <table class="table table-striped projects">
                                            <thead>
                                                <tr>
                                                    <th style="width: 1%">#</th>
                                                    <th style="width: 10%">Full Name</th>
                                                    <th style="width: 20%">Email</th>
                                                    <th style="width: 20%">Subject</th>
                                                    <th style="width: 20%">Message</th>
                                                    <th>Status</th>
                                                    <th style="width: 20%">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>#</td>
                                                    <td>
                                                        full name
                                                    </td>
                                                    <td>
                                                        abc@mail.com
                                                    </td>
                                                    <td>
                                                        subject
                                                    </td>
                                                    <td>
                                                        message
                                                    </td>
                                                    <td>
                                                        <span class="badge badge-success">Active</span>
                                                    </td>
                                                    <td>
                                                        <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-folder"></i> View </a>
                                                        <a href="#" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
                                                        <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Delete </a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- footer content -->
                <Footer />
                <!-- /footer content -->
            </div>
        </div>
    </div>
</template>
