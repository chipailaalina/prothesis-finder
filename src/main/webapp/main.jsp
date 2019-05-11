<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="js_css.jsp" %>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Find your prothesis</title>
</head>
<body>
<%@ include file="header.jsp" %>


<div class="col-xs-offset-1">
    <div class="row form-group">
        <div class="col-xs-1">
            <label class="control-label"> Sex : </label>
            <select class="form-control filter" id="sex">
                <option></option>
                <option>F</option>
                <option>M</option>
            </select>
        </div>
        <div class="col-xs-1">
            <label class="control-label"> Age : </label>
            <input class="form-control filter" id="age" type="number"/>
        </div>
        <div class="col-xs-1">
            <label class="control-label"> Weight : </label>
            <input class="form-control filter" id="weight" type="number"/>
        </div>
        <div class="col-xs-1">
            <label class="control-label"> Activity : </label>
            <select class="form-control filter" id="activity">
                <option></option>
                <option>Active</option>
                <option>Passive</option>
            </select>
        </div>
        <div class="col-xs-1">
            <label class="control-label"> Bone density : </label>
            <select class="form-control filter" id="boneDensity">
                <option></option>
                <option>Normal</option>
                <option>Low</option>
            </select>
        </div>
        <div class="col-xs-2">
            <label class="control-label"> Arthroplasty type : </label>
            <select class="form-control filter" id="arthroplastyType">
                <option></option>
                <option>Total</option>
                <option>Hemi</option>
            </select>
        </div><div class="col-xs-2">
            <label class="control-label"> Implant type : </label>
            <select class="form-control filter" id="implantType">
                <option></option>
                <option>Primary</option>
                <option>Revision</option>
            </select>
        </div>
        <div class="col-xs-2">
            <label class="control-label"> Fixing type : </label>
            <select class="form-control filter" id="fixingType">
                <option></option>
                <option>Cemented</option>
                <option>Press-to-fit</option>
            </select>
        </div>
    </div>
</div>
<div class="col-xs-10 col-xs-offset-1">
    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>Sex</th>
            <th>Age min</th>
            <th>Age max</th>
            <th>Weight min</th>
            <th>Weight max</th>
            <th>Activity</th>
            <th>Bone density</th>
            <th>Arthroplasty type</th>
            <th>Implant type</th>
            <th>Fixing type</th>
            <th>Implant model</th>
            <th>Implant brochure</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="prot" items="${prothesis}">
            <tr>
                <td>${prot.sex}</td>
                <td>${prot.minAge}</td>
                <td>${prot.maxAge}</td>
                <td>${prot.minWeight}</td>
                <td>${prot.maxWeight}</td>
                <td>${prot.activity}</td>
                <td>${prot.boneDensity}</td>
                <td>${prot.arthroplastyType}</td>
                <td>${prot.implantType}</td>
                <td>${prot.fixingType}</td>
                <td><a href="./resources/images/${prot.model}.jpg" target="_blank"><img src="./resources/images/${prot.model}.jpg" height="120px" alt="" border="0" /></a></td>
                <td><a href="./resources/brochures/${prot.model}.pdf" target="_blank">Open brochure</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br/>
</div>
<%@ include file="footer.jsp" %>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        var table = $('table').DataTable({
            "dom": 'frtip',
            "saveState": true
        });

        /* Custom filtering function which will search data in column four between two values */
        $(".filter").on('change', function() {
            $.fn.dataTable.ext.search.push(
                function (settings, data, dataIndex) {
                    var result = true;

                    var s = $('#sex').val();
                    if (s.localeCompare('') != 0) {
                        var sex = data[0].split("/");
                        result = false;
                        for (var i = 0; i < sex.length; i++) {
                            if (s.indexOf(sex[i]) != -1) result = true;
                        }
                    }

                    var age = parseFloat($('#age').val());
                    if (result && !isNaN(age) && (age < parseFloat(data[1]) || age > parseFloat(data[2]))) return false;

                    var weight = parseFloat($('#weight').val());
                    if (result && !isNaN(weight) && (weight < parseFloat(data[3]) || weight > parseFloat(data[4]))) return false;

                    var activity = $('#activity').val();
                    if (result && activity.localeCompare('') != 0 && activity.localeCompare(data[5]) != 0) return false;

                    var boneDensity = $('#boneDensity').val();
                    if (result && boneDensity.localeCompare('') != 0 && boneDensity.localeCompare(data[6]) != 0) return false;

                    var arthroplastyType = $('#arthroplastyType').val();
                    if (result && arthroplastyType.localeCompare('') != 0 && arthroplastyType.localeCompare(data[7]) != 0) return false;

                    var implantType = $('#implantType').val();
                    if (result && implantType.localeCompare('') != 0 && implantType.localeCompare(data[8]) != 0) return false;

                    var fixingType = $('#fixingType').val();
                    if (result && fixingType.localeCompare('') != 0) {
                        var f = data[9].split('/');
                        result = false;
                        for (var i = 0; i < f.length; i++) {
                            if (fixingType.indexOf(f[i]) != -1) result = true;
                        }
                    }

                    return result;
                }
            );
            table.draw();
            $.fn.dataTable.ext.search.pop();
        });
    });
</script>
</html>