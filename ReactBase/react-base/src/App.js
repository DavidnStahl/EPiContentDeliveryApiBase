import './App.css';
//import { useSelector, useDispatch } from 'react-redux'
//import {increment} from './actions';


//import EpiserverFooterBlockComponent from './components/EpiserverFooterBlockComponent';
import EpiserverHeaderBlockComponent from './components/EpiserverHeaderBlockComponent';
//import EpiserverPageComponent from './components/EpiserverPageComponent'


function App() {

  
  //const headerBlockModel = useSelector(state => state.headerBlockModel);
  //const pageModel = useSelector(state => state.pageModel);
  //const footerBlockModel = useSelector(state => state.footerBlockModel);

  //const counter = useSelector(state => state.counter)
  //const disPatch = useDispatch();
  return (
    <div className="App">
      {/*<h1>Counter {counter}</h1>
      <button onClick={() => disPatch(increment())}>+</button>
      <button>-</button>*/}
        <EpiserverHeaderBlockComponent/>
        {/*<EpiserverPageComponent/>
        <EpiserverFooterBlockComponent/>*/}


    </div>
  );
}

export default App;
