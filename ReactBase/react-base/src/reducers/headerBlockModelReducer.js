

const headerBlockModelReducer = (state = "nej", action) => {
  if(action.type === "ja")
  {
    return "ja"
  }
  else{
    return state
  }
}



/*const getHeaderBlock = () => {
  const episerverDomainName = 'http://localhost:64473/';
  const url = episerverDomainName + `api/navigation`;

  fetch(url)
      .then( response => {
        if (!response.ok) { throw response }
        return response.json()
      })
      .then( json => {

        return json 
      })
      .catch( err => {
        console.log(err)
        })
}*/



export default headerBlockModelReducer;