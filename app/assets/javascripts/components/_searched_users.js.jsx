class SearchedUsers extends React.Component {
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
    var searchedusers = this.props.searched_users
    var displayusers = []
    for(let i of searchedusers){
      displayusers.push(
        <div key={i.id}>
          <h3 class="profile-username">{i.username}</h3>
        </div>
      )
    }

    return(
      <div>
       {displayusers}
      </div>
     )
  }
}
