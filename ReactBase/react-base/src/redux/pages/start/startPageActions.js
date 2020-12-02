import {saveDataToCache,getCache} from '../../../cache/index'
import {
    websiteName,
    getcontent}
    from '../../../helper/index'

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

export const fetchStartPageSuccess = (startPage,informationContentArea) => {

    return {
        type: FETCH_STARTPAGE_SUCCESS,
        payload: startPage,
        informationContentArea: informationContentArea
    }
}

export const fetchStartPageFailure = error => {
    return {
        type: FETCH_STARTPAGE_FAILURE,
        payload: error
    }
}

export const fetchStartPage  = () => {
    const startpageCache = getCache("startPage");
    if(startpageCache === null){
        return async (dispatch) => {
            dispatch(fetchStartPageRequest())  
            await fetch(websiteName + getcontent + 5,{
                headers: {
                    'Accept-language': ''
                }
            }).then( response => {
                if(!response.ok){
                    throw Error(response.statusText)
                }
                return response.json()
            }).then( json => {
                fetchBlockData(json,dispatch);
            }).catch(error => {
                dispatch(fetchStartPageFailure(error))
            })               
        }
    }
    else{
        return (dispatch) => {
            dispatch(fetchStartPageSuccess(startpageCache,getCache("informationContentArea")))
        }
   }
             
}

const fetchBlockData = async (data,dispatch)  => {
    const blockArray = [];
    const informationContentArea = [];
    data.informationContentArea.value.forEach( element => {
       blockArray.push(element.contentLink.id)
    })     
    for (var i = 0; i < blockArray.length; i++){
        await fetch(websiteName + getcontent + blockArray[i],{
        headers: {
            'Accept-language': ''}
        })
        .then( response => {
            if(!response.ok){
                throw Error(response.statusText)
            }
            return response.json()
        })
        .then( json => {
            informationContentArea.push(json)
            saveDataToCache("startPage",data);
            saveDataToCache("informationContentArea",informationContentArea)
            dispatch(fetchStartPageSuccess(data,informationContentArea))             
        }).catch(error => {
            dispatch(fetchStartPageFailure(error))
        })
        
    }
}








