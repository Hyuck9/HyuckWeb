<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Outer Row -->
<div class="row justify-content-center">

	<div class="col-xl-10 col-lg-12 col-md-9">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-6 d-none d-lg-block custom-bg-login"></div>
					<div class="col-lg-6">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">로그인</h1>
							</div>
							<form class="user">
								<div class="form-group">
									<label for="exampleInputEmail"></label><input type="email" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Email Address...">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword"></label><input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password">
								</div>
								<div class="form-group">
									<div class="custom-control custom-checkbox small">
										<input type="checkbox" class="custom-control-input" id="customCheck">
										<label class="custom-control-label" for="customCheck">Remember Me</label>
									</div>
								</div>
								<button type="button" class="btn btn-primary btn-user btn-block" onclick="getLogin();">로그인</button>
								<hr>
								<button type="button" class="btn btn-google btn-user btn-block" onclick="getLogin();"><i class="fab fa-google fa-fw"></i> Login with Google</button>
								<button type="button" class="btn btn-facebook btn-user btn-block" onclick="getLogin();"><i class="fab fa-facebook-f fa-fw"></i> Login with Facebook</button>
							</form>
							<hr>
							<div class="text-center">
								<a class="small" href="${pageContext.request.contextPath}/login/forgotPassword.do">Forgot Password?</a>
							</div>
							<div class="text-center">
								<a class="small" href="${pageContext.request.contextPath}/login/joinForm.do">Create an Account!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</div>

<script>
	function getLogin() {
		location.href = contextPath + "/main/dashboard.do";
	}
</script>