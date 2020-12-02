import {saveDataToCache,getCache} from '../../../cache/index'
import {
    websiteName,
    getcontent}
    from '../../../helper/index'

import {
    FETCH_INSTRUCTIONPAGE_REQUEST,
    FETCH_INSTRUCTIONPAGE_SUCCESS,
    FETCH_INSTRUCTIONPAGE_FAILURE}
    from './instructionPageTypes'

export const fetchInstructionPageRequest = () => {
    return {
        type: FETCH_INSTRUCTIONPAGE_REQUEST
    }
}

export const fetchInstructionPageSuccess = (instructionPage,instructionContentArea) => {
    return {
        type: FETCH_INSTRUCTIONPAGE_SUCCESS,
        payload: instructionPage,
        instructionContentArea: instructionContentArea
    }
}

export const fetchInstructionPageFailure = error => {
    return {
        type: FETCH_INSTRUCTIONPAGE_FAILURE,
        payload: error
    }
}

export const fetchInstructionPage  = () => {
    const instructionPageCache = getCache("instructionPage");
    if(instructionPageCache === null){
        return async (dispatch) => {
            dispatch(fetchInstructionPageRequest())  
            await fetch(websiteName + getcontent + 9,{
                headers: {'Accept-language': ''}
            }).then( response => {
                if(!response.ok){
                    throw Error(response.statusText)
                }
                return response.json()
            }).then( json => {
                fetchBlockData(json,dispatch) 
            }).catch(error =>{
                dispatch(fetchInstructionPageFailure(error))
            })           
        }
    }
    else{
        return (dispatch) => {
            dispatch(fetchInstructionPageSuccess(instructionPageCache,getCache("instructionContentArea")))
        }
    }          
}

const fetchBlockData = async (data,dispatch)  => {
    const blockArray = [];
    const instructionContentArea = [];
    data.instructionContentArea.value.forEach( element => {
       blockArray.push(element.contentLink.id)
    })     
    for (var i = 0; i < blockArray.length; i++){
        await fetch(websiteName + getcontent + blockArray[i],{
        headers: {'Accept-language': ''}
        }).then( response => {
            if(!response.ok){throw Error(response.statusText)}
            return response.json()
        }).then( json => {
            instructionContentArea.push(json)
            saveDataToCache("instructionPage",data);
            saveDataToCache("instructionContentArea",instructionContentArea)
            dispatch(fetchInstructionPageSuccess(data,instructionContentArea))                
        }).catch(error => {
            dispatch(fetchInstructionPageFailure(error))
        })               
    }
}
