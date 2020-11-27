import {
    FETCH_HEADER_REQUEST,
    FETCH_HEADER_SUCCESS,
    FETCH_HEADER_FAILURE}
    from './headerTypes'

const initialState = {
    loading: false,
    header: [],
    error: ''
}

const reducer = (state = initialState, action) => {
    switch(action.type) {
        case FETCH_HEADER_REQUEST:
            return {
                ...state,
                loading: true
            }
        case FETCH_HEADER_SUCCESS:
            return {
                loading: false,
                header: action.payload,
                error: ''
            }
        case FETCH_HEADER_FAILURE:
            return {
                loading: false,
                header: initialState,
                error: action.payload
            }
        default: return state
    }
}

export default reducer