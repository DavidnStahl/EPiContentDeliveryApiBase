//const episerverDomainName = 'http://localhost:64473/';


const pageModelReducer = (state = "", action) => {
    return "";
    //state = getPage(action.ID)
    //return state;
}

/*const getPage = (id) => {
    const url = episerverDomainName + `api/episerver/v2.0/content/${id}`;
  
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

export default pageModelReducer;