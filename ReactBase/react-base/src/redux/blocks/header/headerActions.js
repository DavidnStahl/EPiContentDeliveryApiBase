import {saveDataToCache,getCache} from '../../../cache/index'
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
    const cache = getCache("Header");
    if(cache === null){
        return async (dispatch) => {
            dispatch(fetchHeaderRequest())  
            const data = await fetch(`http://localhost:64473/api/navigation`,{
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
            saveDataToCache("Header",data);
            dispatch(fetchHeaderSuccess(data))
        }
    }
    else{
        return (dispatch) => {
            dispatch(fetchHeaderSuccess(cache))
        }
    }          
}


