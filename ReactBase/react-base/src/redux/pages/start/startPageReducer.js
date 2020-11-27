import {
    FETCH_STARTPAGE_REQUEST,
    FETCH_STARTPAGE_SUCCESS,
    FETCH_STARTPAGE_FAILURE}
    from './startPageTypes'

const initialState = {
    loading: false,
    startPage: [],
    error: ''
}

const reducer = (state = initialState, action) => {
    switch(action.type) {
        case FETCH_STARTPAGE_REQUEST:
            return {
                ...state,
                loading: true
            }
        case FETCH_STARTPAGE_SUCCESS:
            return {
                loading: false,
                startPage: action.payload,
                error: ''
            }
        case FETCH_STARTPAGE_FAILURE:
            return {
                loading: false,
                startPage: initialState,
                error: action.payload
            }
        default: return state
    }
}

export default reducer