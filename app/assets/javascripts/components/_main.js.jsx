const Main = (props) => {
  // const curr_user = {current_user: props.current_user, total_followers: props.total_followers, total_following: props.total_following, fullname: props.fullname};
  return(
    <div>
      <UserProfile userinfo = {props.userinfo} />
    </div>
  )
}
