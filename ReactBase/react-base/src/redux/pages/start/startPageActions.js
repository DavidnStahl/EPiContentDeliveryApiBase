import {
    FETCH_STARTPAGE_REQUEST,
    FETCH_STARTPAGE_SUCCESS,
    FETCH_STARTPAGE_FAILURE}
    from './startPageTypes'


export const fetchStartPageRequest = () => {
    return {
        type: FETCH_STARTPAGE_REQUEST
    }
}

export const fetchStartPageSuccess = startPage => {
    return {
        type: FETCH_STARTPAGE_SUCCESS,
        payload: startPage
    }
}

export const fetchStartPageFailure = error => {
    return {
        type: FETCH_STARTPAGE_FAILURE,
        payload: error
    }
}



export const fetchStartPage  = () => {

    return async (dispatch, getState) => {

        dispatch(fetchStartPageRequest)
        var state = getState()
        console.log(state)
        const startPageID = await fetch('http://localhost:64473/api/navigation')
        .then( response => {
            return response.json()
          })
          .then( json => {
              return json[0].ContentGuid.toString();
              
          })
        
        const startPage = await fetch(`http://localhost:64473//api/episerver/v2.0/content/${startPageID}`,{
            headers: {
                'Accept-language': ''
            }
        })
        .then( response => {
          return response.json()
        })
        .then( json => {
            return json;
        })
          dispatch(fetchStartPageSuccess(startPage))
    }
          
}
