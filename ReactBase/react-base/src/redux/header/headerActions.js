

import {
    FETCH_HEADER_REQUEST,
    FETCH_HEADER_SUCCESS,
    FETCH_HEADER_FAILURE}
    from './headerTypes'


export const fetchHeaderRequest = () => {
    return {
        type: FETCH_HEADER_REQUEST
    }
}

export const fetchHeaderSuccess = header => {
    return {
        type: FETCH_HEADER_SUCCESS,
        payload: header
    }
}

export const fetchHeaderFailure = error => {
    return {
        type: FETCH_HEADER_FAILURE,
        payload: error
    }
}

export const fetchHeader  = () => {

    return async (dispatch) => {
        dispatch(fetchHeaderRequest)        
        var header = await fetch('http://localhost:64473/api/navigation')
        .then( response => {
          return response.json()
        })
        .then( json => {
            return json;
        })
          console.log(header)
          dispatch(fetchHeaderSuccess(header))
        }
          
}

