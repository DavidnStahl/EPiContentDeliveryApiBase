import { combineReducers } from 'redux'
import headerReducer from './blocks/header/headerReducer'
import footerReducer from './blocks/footer/footerReducer'
import startPageReducer from './pages/start/startPageReducer'
import descriptionBlockReducer from './blocks/description/descriptionBlockReducer'

const rootReducer = combineReducers({
   header: headerReducer,
   footer: footerReducer,
   startPage: startPageReducer,
   descriptionBlock: descriptionBlockReducer
})

export default rootReducer