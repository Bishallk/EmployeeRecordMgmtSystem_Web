
<form action="${pageContext.request.contextPath}/addEmployee" method="post" enctype="multipart/form-data" class="m-3">
    <div class="d-block">

        <div class="mb-3 col">
            <label for="eId" class="form-label">Employee Id</label>
            <input name="eId" type="text" class="form-control" id="eId" placeholder="Employee Id" required>
        </div>
        <div class="mb-3 col">
            <label for="eName" class="form-label">Name</label>
            <input name="eName" type="text" class="form-control" id="eName"
                   placeholder="Employee name" required>
        </div>
        <div class="mb-3 col">
            <label for="eGender" class="form-label">Gender</label>
            <select name="eGender" class="form-select" aria-label="Default select example" id="eGender" required>
                <option disabled selected class="text-bg-danger">Select Gender</option>
                <option>Male</option>
                <option>Female</option>
                <option>Other</option>
            </select>
        </div>


         <div class="mb-3 col">
            <label for="eAddress" class="form-label">Address</label>
            <input name="eAddress" type="text" class="form-control" id="eAddress"
                   placeholder="Employee Address" required>
        </div>

        <div class="mb-3 col">
            <label for="eDepartment" class="form-label">Department</label>
            <select name="eDepartment" class="form-select" aria-label="Default select example" id="eDepartment">
                <option disabled selected class="text-bg-danger">Select Department</option>
                <option>Sales</option>
                <option>Human Resources</option>
                <option>Information Technology</option>
                <option>Marketing</option>
                <option>Finance</option>
                <option>Operations</option>
                <option>Customer Service</option>
                <option>Research & Development</option>
            </select>
        </div>
        <div class="mb-3 col">
            <label for="eSalary" class="form-label">Salary</label>
            <input name="eSalary" type="number" class="form-control" id="eSalary"
                   placeholder="Employee salary" min="0" required>
        </div>

        <div class="mb-3 col">
            <label for="eProfile" class="form-label">Profile Image</label>
            <input name="eProfile" type="file" class="form-control" id="eProfile" required>
        </div>

        <div class="row m-3 justify-content-around">
            <input type="submit" value="Add" class="col-6 btn btn-success ">
            <input type="reset" value="Clear" class="col-5 btn btn-danger">
        </div>
    </div>
</form>