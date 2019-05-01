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
            <input class="form-control filter" id="boneDensity" type="number"/>
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
                <option>Concrete</option>
                <option>Brute</option>
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
            <th>Bone density min</th>
            <th>Bone density max</th>
            <th>Arthroplasty type</th>
            <th>Implant type</th>
            <th>Fixing type</th>
            <th>Implant model</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="prot" items="${prothesis}">
            <tr>
                <th>${prot.sex}</th>
                <th>${prot.minAge}</th>
                <th>${prot.maxAge}</th>
                <th>${prot.minWeight}</th>
                <th>${prot.maxWeight}</th>
                <th>${prot.activity}</th>
                <th>${prot.minBoneDensity}</th>
                <th>${prot.maxBoneDensity}</th>
                <th>${prot.arthroplastyType}</th>
                <th>${prot.implantType}</th>
                <th>${prot.fixingType}</th>
                <th>${prot.model}</th>
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
                    var sex = $('#sex').val();
                    if (sex.localeCompare('') != 0 && sex.localeCompare(data[0]) != 0) result = false;

                    var age = parseFloat($('#age').val());
                    if (result && !isNaN(age) && (age < parseFloat(data[1]) || age > parseFloat(data[2]))) result = false;

                    var weight = parseFloat($('#weight').val());
                    if (result && !isNaN(weight) && (weight < parseFloat(data[3]) || weight > parseFloat(data[4]))) result = false;

                    var activity = $('#activity').val();
                    if (result && activity.localeCompare('') != 0 && activity.localeCompare(data[5]) != 0) result = false;

                    var boneDensity = parseFloat($('#boneDensity').val());
                    if (result && !isNaN(boneDensity) && (boneDensity < parseFloat(data[6]) || boneDensity > parseFloat(data[7]))) result = false;

                    var arthroplastyType = $('#arthroplastyType').val();
                    if (result && arthroplastyType.localeCompare('') != 0 && arthroplastyType.localeCompare(data[8]) != 0) result = false;

                    var implantType = $('#implantType').val();
                    if (result && implantType.localeCompare('') != 0 && implantType.localeCompare(data[9]) != 0) result = false;

                    var fixingType = $('#fixingType').val();
                    if (result && fixingType.localeCompare('') != 0 && fixingType.localeCompare(data[10]) != 0) result = false;

                    return result;
                }
            );
            table.draw();
            $.fn.dataTable.ext.search.pop();
        });
    });
</script>
</html>