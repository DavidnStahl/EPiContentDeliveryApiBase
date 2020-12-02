import {
    FETCH_FOOTER_REQUEST,
    FETCH_FOOTER_SUCCESS,
    FETCH_FOOTER_FAILURE}
    from './footerTypes'

const initialState = {
    loading: false,
    footer: false,
    error: ''
}

const reducer = (state = initialState, action) => {
    switch(action.type) {
        case FETCH_FOOTER_REQUEST:
            return {
                ...state,
                loading: true
            }
        case FETCH_FOOTER_SUCCESS:
            return {
                loading: false,
                footer: action.payload,
                error: ''
            }
        case FETCH_FOOTER_FAILURE:
            return {
                loading: false,
                footer: initialState,
                error: action.payload
            }
        default: return state
    }
}

export default reducer