<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.springdemo.models.UserDetails" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="mytags" uri="/mytags" %>
	<b><h3>${message}</h3></b>
	<div id="content"></div>
	<script type="text/babel">
			var UsersList = React.createClass({
					getInitialState: function() {
						return {editing: false}
					},
					edit: function() {
						this.setState({editing: true});
					},
					save: function() {
						alert(this.refs.userNameRef.value);
						this.setState({editing: false});
					},
					remove: function() {
						alert("Removing");
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
											<td><input type="text" ref="userNameRef" value={this.props.userName} id="userName" name="userName" onChange={function() {}}/></td>
											<td>&nbsp;</td>
											<td><input type="text" ref="phoneNumberRef" value={this.props.phoneNumber} id="phoneNumber" name="phoneNumber" onChange={function() {}}/></td>
											<td><button onClick={this.save} className="button-success">Save</button></td>
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
			ReactDOM.render(	<div>
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
													</table>
												</div>
											, document.getElementById('content'));
	</script>
<%@ include file="/footer.jsp" %>
