class UserProfile extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      users: []
    };
  }

  componentDidMount(){
    fetch('/api/v1/users.json')
      .then((response) => {return response.json()})
      .then((data) => {this.setState({ users: data }) });
  }

  render(){
    var curr_user = (
       <div key={this.props.userinfo[0].id}>
         <div>
          <h3 class="profile-username">{this.props.userinfo[0].username}</h3>
          <a href={"localhost:3000/users/edit/"+ this.props.userinfo[0].id} class= "btn btn-secondary edit-profile-btn">Edit Profile</a>
        </div>
        <div class = "stats">
          <strong>{this.props.userinfo[1]}</strong> posts
          <strong> {this.props.userinfo[2]}</strong> followers
          <strong> {this.props.userinfo[3]}</strong> following
        </div>
        <strong> {this.props.userinfo[4]}</strong>
        {this.props.userinfo[0].bio}
       </div>
     )

    return(
      <div>
       {curr_user}
      </div>
     )
  }
}
