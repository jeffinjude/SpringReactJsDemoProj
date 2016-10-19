<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/header.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="com.springdemo.models.UserDetails"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="mytags" uri="/mytags"%>
<c:choose>
	<c:when test="${fn:length(message) > 0}">
		<b><h3>${message}</h3></b>
	</c:when>
</c:choose>

<div id="content"></div>

<script type="text/babel">
	var userName = "";
	var phoneNumber = "";
	
	var UsersList = React.createClass({
		getInitialState: function() {
			return {editing: false}
		},
		edit: function() {
			this.setState({editing: true});
		},
		update: function() {
			//updating the view
			this.props.userName = this.refs.userNameRef.value;
			this.props.phoneNumber = this.refs.phoneNumberRef.value;
			this.setState({editing: false});

			//updating the database
			var formData = {
					'userId' : this.props.userId,
					'userName' : this.props.userName,
					'phoneNumber' : this.props.phoneNumber
			};
			$.ajax({
				type        : 'POST',
				url         : 'UpdateUserDetails',
				data        : formData,
				dataType    : 'json',
				encode      : true
			});

		},
		cancelUpdate: function(){
			this.setState({editing: false});
		},
		remove: function() {
			var id = this.props.userId;
			$("#record_"+id).css("backgroundColor","#fb6c6c");

			setTimeout(function(){
				var r = confirm("Are you sure you want to delete this record?");
				if (r == false) {
					$("#record_"+id).css("backgroundColor","#d4d1d5");
					event.preventDefault();
				}
				else
				{
					$.ajax({
					type: 'get',
					url: 'DeleteUserDetails?userId='+id,
					beforeSend: function() {

					},
					success: function() {
					$("#record_"+id).css("display","none");
					}
					});
				}
			}, 500);
		},
		renderUserList: function() {
			return (
						<tr className="record" id={"record_" + this.props.userId}>
							<td>{this.props.userId}</td>
							<td>&nbsp;</td>
							<td>{this.props.userName}</td>
							<td>&nbsp;</td>
							<td>{this.props.phoneNumber}</td>
							<td><a href="#" onClick={this.edit}>Edit</a> | <a onClick={this.remove} className="deleteUser" id={this.props.userId} href="#">Delete</a></td>
						</tr>
			);
		},
		renderEditForm: function() {
			return (
						<tr className="record" id={"record_" + this.props.userId}>
							<td>{this.props.userId}</td>
							<td>&nbsp;</td>
							<td><input type="text" className="form-control" ref="userNameRef" defaultValue ={this.props.userName} id="userName" name="userName" onChange={function() {}}/></td>
							<td>&nbsp;</td>
							<td><input type="text" className="form-control" ref="phoneNumberRef" defaultValue ={this.props.phoneNumber} id="phoneNumber" name="phoneNumber" onChange={function() {}}/></td>
							<td><a href="#" onClick={this.update}>Update</a> | <a href="#" onClick={this.cancelUpdate}>Cancel</a></td>
						</tr>
			);
		},
		render: function() {
				if(this.state.editing){
					return this.renderEditForm();
				}
				else {
					return this.renderUserList();
				}
		}
	});

	var Users = React.createClass({
		getInitialState: function() {
			return {adding: false}
		},
		add: function() {
			this.setState({adding: true});
		},
		save: function() {
			//updating the view
			this.setState({adding: false});
			userName = this.refs.userNameRef.value;
			phoneNumber = this.refs.phoneNumberRef.value;

			//updating the database
			var formData = {
					'userName' : this.refs.userNameRef.value,
					'phoneNumber' : this.refs.phoneNumberRef.value
			};
			$.ajax({
				type        : 'POST',
				url         : 'SaveUserDetails',
				data        : formData,
				dataType    : 'json',
				encode      : true
			});
		},
		cancelSave: function() {
			this.setState({adding: false});
		},
		renderUserAddForm: function() {
			return(
					<div>
						<table className="flatTable">
							<tr className="titleTr">
								<td><b>User ID</b></td>
								<td>&nbsp;</td>
								<td><b>User Name</b></td>
								<td>&nbsp;</td>
								<td><b>Phone Number</b></td>
								<td><b>Actions</b></td>
							</tr>
							<c:choose>
								<c:when test="${fn:length(userDetails) > 0}">
								<c:forEach var="user" items="${userDetails}">
										<UsersList userId="${user.getUserId()}" userName="${user.getUserName()}" phoneNumber="${user.getPhoneNumber()}"/>
								</c:forEach>
								</c:when>
								<c:otherwise>
								<tr><td><b>No Records!</b></td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
								</c:otherwise>
							</c:choose>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td><input type="text" className="form-control" ref="userNameRef" id="userName" name="userName" onChange={function() {}}/></td>
								<td>&nbsp;</td>
								<td><input type="text" className="form-control" ref="phoneNumberRef" id="phoneNumber" name="phoneNumber" onChange={function() {}}/></td>
								<td><a href="#" onClick={this.save}>Save</a> | <a href="#" onClick={this.cancelSave}>Cancel</a></td>
							</tr>
						</table>
					</div>
			);
		},
		renderUserList: function() {
				return(
					<div>
						<table className="flatTable">
							<tr className="titleTr">
								<td><b>User ID</b></td>
								<td>&nbsp;</td>
								<td><b>User Name</b></td>
								<td>&nbsp;</td>
								<td><b>Phone Number</b></td>
								<td><b>Actions</b></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td><a href="#" onClick={this.add}>Add</a></td>
							</tr>
							<c:choose>
								<c:when test="${fn:length(userDetails) > 0}">
								<c:forEach var="user" items="${userDetails}">
										<UsersList userId="${user.getUserId()}" userName="${user.getUserName()}" phoneNumber="${user.getPhoneNumber()}"/>
								</c:forEach>
								</c:when>
								<c:otherwise>
								<tr><td><b>No Records!</b></td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${fn:length(userName) > 0}">
									<tr>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td>${userName}</td>
										<td>&nbsp;</td>
										<td>${phoneNumber}</td>
										<td><a href="#" onClick={this.save}>Save</a> | <a href="#" onClick={this.cancelSave}>Cancel</a></td>
									</tr>
								</c:when>
							</c:choose>
						</table>
					</div>
			);
		},
		render: function() {
				if(this.state.adding){
					return this.renderUserAddForm();
				}
				else {
					return this.renderUserList();
				}
		}
	});

ReactDOM.render(<Users/>, document.getElementById('content'));
</script>
<%@ include file="/footer.jsp"%>
