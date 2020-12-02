import {saveDataToCache,getCache} from '../../../cache/index'
import {
    websiteName,
    getNavigation}
    from '../../../helper/index'

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
            await fetch(websiteName + getNavigation,{
                headers: {'Accept-language': ''}
            }).then( response => {
                if(!response.ok){
                    throw Error(response.statusText)
                }
                return response.json()
            }).then( json => {
                saveDataToCache("Header",json);
                dispatch(fetchHeaderSuccess(json))
            }).catch(error => {
                dispatch(fetchHeaderRequest(error))
            })           
        }
    }
    else{
        return (dispatch) => {
            dispatch(fetchHeaderSuccess(cache))
        }
    }          
}


