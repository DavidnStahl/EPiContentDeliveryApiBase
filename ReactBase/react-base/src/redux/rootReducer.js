import { combineReducers } from 'redux'
import headerReducer from './blocks/header/headerReducer'
import footerReducer from './blocks/footer/footerReducer'
import startPageReducer from './pages/start/startPageReducer'

const rootReducer = combineReducers({
   header: headerReducer,
   footer: footerReducer,
   startPage: startPageReducer
})

export default rootReducer