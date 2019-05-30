<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="navbar">
	<div class="container-fluid">
		<div class="row-fluid">
			<form action="home" method="post">
				<div class="logoAA">
					<button class="headerButton" type="submit"><img src="./resources/app/meshfem1.png"" alt="" border="0" /></button>
				</div>


				<div class="collapse navbar-collapse header-right-title">
					<ul class="nav navbar-nav">
						<li><button type="submit" class="headerButton"><h1>Find your prothesis</h1></button></li>
					</ul>
                </div>
                <div class="header-right">
                    <div class="row form-inline">
                        <div class="form-group col-xs-2">
                            <label class="control-label">Sex:</label>
                            <select class="form-control filter" id="sex">
                                <option></option>
                                <option>F</option>
                                <option>M</option>
                            </select>
                        </div>
                        <div class="form-group col-xs-2">
                            <label class="control-label">Age [years]:</label>
                            <input class="form-control filter" maxlength="5" id="age" type="number"/>
                        </div>
                        <div class="form-group col-xs-2">
                            <label class="control-label">Weight [kg]:</label>
                            <input class="form-control filter" maxlength="5"  id="weight" type="number"/>
                        </div>
                        <div class="form-group col-xs-2">
                            <label class="control-label">Activity:</label>
                            <select class="form-control filter" id="activity">
                                <option></option>
                                <option>Active</option>
                                <option>Passive</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="row form-inline">
                        <div class="form-group col-xs-2">
                            <label class="control-label">Bone density:</label>
                            <select class="form-control filter" id="boneDensity">
                                <option></option>
                                <option>Normal</option>
                                <option>Low</option>
                            </select>
                        </div>
                        <div class="form-group col-xs-2">
                            <label class="control-label">Arthroplasty type:</label>
                            <select class="form-control filter" id="arthroplastyType">
                                <option></option>
                                <option>Total</option>
                                <option>Hemi</option>
                            </select>
                        </div>
                        <div class="form-group col-xs-2">
                            <label class="control-label">Implant type:</label>
                            <select class="form-control filter" id="implantType">
                                <option></option>
                                <option>Primary</option>
                                <option>Revision</option>
                            </select>
                        </div>
                        <div class="form-group col-xs-2">
                            <label class="control-label">Fixing type:</label>
                            <select class="form-control filter" id="fixingType">
                                <option></option>
                                <option>Cemented</option>
                                <option>Press-to-fit</option>
                            </select>
                        </div>
                    </div>
				</div>
			</form>
		</div>
	</div>
</div>