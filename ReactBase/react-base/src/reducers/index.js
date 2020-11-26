//import counterReducer from './counter';
import headerBlockModelReducer from './headerBlockModelReducer'
//import pageModelReducer from './pageModelReducer'
//import footerBlockModelReducer from './footerBlockModelReducer'
import {combineReducers} from 'redux';


const allReducers = combineReducers({
    headerModel : headerBlockModelReducer,
    //pageModel : pageModelReducer,
    //footerModel : footerBlockModelReducer
});

export default allReducers;