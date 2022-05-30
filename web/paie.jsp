<%-- 
    Document   : paiement-addition
    Created on : 24 mai 2022, 09:26:56
    Author     : admin
--%>

<%@page import="model.Addition"%>
<%@page import="java.util.List"%>
<%@page import="model.Paiement"%>
<%@page import="model.TypePaiement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String idAddition=request.getParameter("idAddition");
    //String montant=request.getParameter("montant");
    TypePaiement t=new TypePaiement();
    TypePaiement[] tp=t.lister();
    %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                          <h2 class="main-heading">Paiement addition</h2>
                          <form action="traitement-paiement-addition.jsp" method="get">
                              <select name="typePaiement"  class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                  <% for (int i=0;i<tp.length;i++){ %>
                                  <option value="<% out.print(tp[i].getTypePaie()); %>"><% out.print(tp[i].getIntitule()); %></option>
                                  <% } %>
                              </select>
                              <input type="text" name="idAddition" value="<% out.print(idAddition); %>" style="display:none">
                              montant à payer :<input type="text" name="montant" class="form-control">
                              <input type="submit" value="payer" class="btn btn-primary my-1">>
                          </form>
                              <table class="table">
                                  <tr>
                                      <th>addition</th>
                                      <th>type</th>
                                      <th>montant</th>
                                      <th>date</th>
                                  </tr>
                                  <% List<Paiement> p=Addition.getListePaiement(idAddition);
                                    for( int i=0;i<p.size();i++){
                                  %>
                                  <tr>
                                      <td><% out.print(p.get(i).getIdTypePaiement()); %></td>
                                      <td><% out.print(p.get(i).getMontant()); %></td>
                                      <td><% out.print(p.get(i).getDate()); %></td>
                                  </tr>
                                  <% } %>
                              </table>
                    

                            
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
    
</body>

</html>