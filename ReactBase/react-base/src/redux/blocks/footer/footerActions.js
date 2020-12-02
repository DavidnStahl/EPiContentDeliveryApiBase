import {saveDataToCache,getCache} from '../../../cache/index'
import {
    websiteName,
    getFooter}
    from '../../../helper/index'

import {
    FETCH_FOOTER_REQUEST,
    FETCH_FOOTER_SUCCESS,
    FETCH_FOOTER_FAILURE}
    from './footerTypes'

export const fetchFooterRequest = () => {
    return {
        type: FETCH_FOOTER_REQUEST
    }
}

export const fetchFooterSuccess = footer => {
    return {
        type: FETCH_FOOTER_SUCCESS,
        payload: footer
    }
}

export const fetchFooterFailure = error => {
    return {
        type: FETCH_FOOTER_FAILURE,
        payload: error
    }
}

export const fetchFooter  = () => {
    const cache = getCache("Footer");
    if(cache === null){
        return async (dispatch) => {
            dispatch(fetchFooterRequest())  
            await fetch(websiteName + getFooter,{
                headers: {'Accept-language': ''}
            }).then( response => {
                if(!response.ok){
                    throw Error(response.statusText)
                }
                return response.json()
            }).then( json => {
                saveDataToCache("Footer",json);
                dispatch(fetchFooterSuccess(json))
            }).catch(error => {
                dispatch(fetchFooterFailure(error))
            })            
        }
    }
    else{
        return (dispatch) => {
            dispatch(fetchFooterSuccess(cache))
        }
    }          
}
