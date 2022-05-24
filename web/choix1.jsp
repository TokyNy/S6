<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
    

<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords"
        content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Ample lite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Ample admin lite dashboard bootstrap 5 dashboard template">
    <meta name="description"
        content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
    <!-- Custom CSS -->
   <link href="css/style.min.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
        data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin5">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" data-logobg="skin6">
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <a class="navbar-brand" href="dashboard.html">
                        <!-- Logo icon -->
                        <b class="logo-icon">
                            <!-- Dark Logo icon -->
<<<<<<< HEAD
                           <!-- <img src="plugins/images/logo-icon.png" alt="homepage" />-->
=======
                            <img src="plugins/images/logo-icon.png" alt="homepage" />
>>>>>>> 585f6daf1237e5ae655c320a8bcfc3480e859dea
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text -->
                        <span class="logo-text">
                            <!-- dark Logo text -->
                            <img src="plugins/images/logo-text.png" alt="homepage" />
                        </span>
                    </a>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
                        href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
                    <ul class="navbar-nav d-none d-md-block d-lg-none">
                        <li class="nav-item">
                            <a class="nav-toggler nav-link waves-effect waves-light text-white"
                                href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
                        </li>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- Right side toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav ms-auto d-flex align-items-center">

                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
<<<<<<< HEAD
                       
=======
                        <li class=" in">
                            <form role="search" class="app-search d-none d-md-block me-3">
                                <input type="text" placeholder="Search..." class="form-control mt-0">
                                <a href="" class="active">
                                    <i class="fa fa-search"></i>
                                </a>
                            </form>
                        </li>
>>>>>>> 585f6daf1237e5ae655c320a8bcfc3480e859dea
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                        <li>
                            <a class="profile-pic" href="#">
<<<<<<< HEAD
                                
=======
                                <img src="plugins/images/users/varun.jpg" alt="user-img" width="36"
                                    class="img-circle"><span class="text-white font-medium">Steave</span></a>
>>>>>>> 585f6daf1237e5ae655c320a8bcfc3480e859dea
                        </li>
                        <!-- ============================================================== -->
                        <!-- User profile and search -->
                        <!-- ============================================================== -->
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <!-- User Profile-->
                        <li class="sidebar-item pt-2">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="choix1.jsp"
                                aria-expanded="false">
                                <i class="far fa-clock" aria-hidden="true"></i>
<<<<<<< HEAD
                                <span class="hide-menu">Choix table</span>
=======
                                <span class="hide-menu">choix table</span>
>>>>>>> 585f6daf1237e5ae655c320a8bcfc3480e859dea
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="addition-non-paye1.jsp"
                                aria-expanded="false">
                                <i class="fa fa-user" aria-hidden="true"></i>
<<<<<<< HEAD
                                <span class="hide-menu">Liste des additions non payes</span>
=======
                                <span class="hide-menu">liste des additions non payes</span>
>>>>>>> 585f6daf1237e5ae655c320a8bcfc3480e859dea
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="commande-cuisine1.jsp"
                                aria-expanded="false">
                                <i class="fa fa-table" aria-hidden="true"></i>
<<<<<<< HEAD
                                <span class="hide-menu">Liste des commandes en cuisine</span>
=======
                                <span class="hide-menu">liste des commandes en cuisine</span>
>>>>>>> 585f6daf1237e5ae655c320a8bcfc3480e859dea
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="addition-par-table1.jsp"
                                aria-expanded="false">
                                <i class="fa fa-font" aria-hidden="true"></i>
<<<<<<< HEAD
                                <span class="hide-menu">Liste des additions par table</span>
=======
                                <span class="hide-menu">liste des additions par table</span>
>>>>>>> 585f6daf1237e5ae655c320a8bcfc3480e859dea
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="affichage-paiement1.jsp"
                                aria-expanded="false">
                                <i class="fa fa-globe" aria-hidden="true"></i>
<<<<<<< HEAD
                                <span class="hide-menu">Paiement</span>
=======
                                <span class="hide-menu">paiement</span>
>>>>>>> 585f6daf1237e5ae655c320a8bcfc3480e859dea
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="ingredients-consomme1.jsp"
                                aria-expanded="false">
                                <i class="fa fa-columns" aria-hidden="true"></i>
<<<<<<< HEAD
                                <span class="hide-menu">Quantite ingredient</span>
=======
                                <span class="hide-menu">quantite ingredient</span>
>>>>>>> 585f6daf1237e5ae655c320a8bcfc3480e859dea
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="liste-commande-livre.jsp"
                                aria-expanded="false">
                                <i class="fa fa-info-circle" aria-hidden="true"></i>
<<<<<<< HEAD
                                <span class="hide-menu">Liste des commandes livré</span>
                            </a>
                        </li>
                        <li class="sidebar-item pt-2">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="stock1.jsp"
                                aria-expanded="false">
                                <i class="far fa-clock" aria-hidden="true"></i>
                                <span class="hide-menu">Stock</span>
                            </a>
                        </li>
                        <li class="sidebar-item pt-2">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="pour-boir1.jsp"
                                aria-expanded="false">
                                <i class="far fa-clock" aria-hidden="true"></i>
                                <span class="hide-menu">Pourboire</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="addition-non-paye1.jsp"
                                aria-expanded="false">
                                <i class="fa fa-info-circle" aria-hidden="true"></i>
                                <span class="hide-menu">Additions</span>
                            </a>
                        </li>
                        
=======
                                <span class="hide-menu">liste des commandes livré</span>
                            </a>
                        </li>
                        <li class="text-center p-20 upgrade-btn">
                            <a href="https://www.wrappixel.com/templates/ampleadmin/"
                                class="btn d-grid btn-danger text-white" target="_blank">
                                Upgrade to Pro</a>
                        </li>
>>>>>>> 585f6daf1237e5ae655c320a8bcfc3480e859dea
                    </ul>

                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb bg-white">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
<<<<<<< HEAD
                        <h4 class="page-title">Choix Table</h4>
=======
                        <h4 class="page-title">Basic Table</h4>
>>>>>>> 585f6daf1237e5ae655c320a8bcfc3480e859dea
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <div class="d-md-flex">
                            <ol class="breadcrumb ms-auto">
                                <li><a href="#" class="fw-normal"></a></li>
                            </ol>
<<<<<<< HEAD
                            <a href="addition-par-table1.jsp" target="_blank"
=======
                            <a href="additionParTable.jsp" target="_blank"
>>>>>>> 585f6daf1237e5ae655c320a8bcfc3480e859dea
                                class="btn btn-danger  d-none d-md-block pull-right ms-3 hidden-xs hidden-sm waves-effect waves-light text-white">voir addition par table
                                </a>
                            
                            
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <form action="traitement-commande.jsp" method="get">
                        <% Vector<Serveur> li=Serveur.getAll();
                                    
                                    
                                    %>
                                    
                                        
                                            <p> Serveur : <select name="idServeur" class="form-control" id="exampleFormControlSelect1">
                                        <% for(int g=0;g<li.size();g++){
                                         %>
                                         <option value="<% out.print(li.get(g).getId()); %>"><% out.print(li.get(g).getNom()); %></option>
                                         <% } %>
                                        </select></p>
                                        
                                       
                                            <p> Table: <select name="idTable" class="form-control" id="exampleFormControlSelect1">
                                        <% Vector<Table> listeTable=Table.getAll();
                                        for(int k=0;k<listeTable.size();k++){
                                        %>
                                        <option value="<% out.print(listeTable.get(k).getId()); %>"><% out.print(listeTable.get(k).getDesc()); %></option>
                                        <% } %>
                                            </select></p>
<<<<<<< HEAD
                                            <div class="row">
                                                <div class="col-md-4"></div>
                                                <div class="col-md-4">
                                                    <button type="submit" class="btn btn-secondary btn-lg btn-block" >Valider</button>
                                                    <p><a href="commande-cuisine1.jsp">cuisine</a></p>
                                                </div>
                                                <div class="col-md-4"></div>
                                            </div>
                                            <p><a href="commande-cuisine1.jsp">cuisine</a></p>
                                            
=======
                                        
                                            <button type="submit" class="btn btn-secondary btn-lg btn-block" >ValiderValiderValiderValider</button>
>>>>>>> 585f6daf1237e5ae655c320a8bcfc3480e859dea
                                                
                                                                                      
                                        
                                    
                                
                                    
                                    
                    </form>
<<<<<<< HEAD
                                 
=======
                                    <p><a href="additionParTable.jsp">voir addition par table</a></p>
>>>>>>> 585f6daf1237e5ae655c320a8bcfc3480e859dea
    

                            
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/app-style-switcher.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.js"></script>
</body>

</html>