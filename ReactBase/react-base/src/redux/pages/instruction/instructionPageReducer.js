import {
    FETCH_INSTRUCTIONPAGE_REQUEST,
    FETCH_INSTRUCTIONPAGE_SUCCESS,
    FETCH_INSTRUCTIONPAGE_FAILURE}
    from './instructionPageTypes'

const initialState = {
    loading: false,
    instructionContentArea: false,
    error: ''
}

const reducer = (state = initialState, action) => {
    switch(action.type) {
        case FETCH_INSTRUCTIONPAGE_REQUEST:
            return {
                ...state,
                loading: true
            }
        case FETCH_INSTRUCTIONPAGE_SUCCESS:
            return {
                loading: false,
                instructionPahe: action.payload,
                instructionContentArea: action.instructionContentArea,
                error: ''
            }
        case FETCH_INSTRUCTIONPAGE_FAILURE:
            return {
                loading: false,
                instructionPage: initialState,
                instructionContentArea: initialState,
                error: action.payload
            }
        default: return state
    }
}

export default reducer