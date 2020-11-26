import './App.css';
import EpiserverHeaderComponent from './Components/EpiserverHeaderComponent'


function App() {
  const epiUrl = "http://localhost:64473/";
  const epiContentID = "5"
  return (
    <div className="App">
      <header className="App-header">
        <EpiserverHeaderComponent url={epiUrl} contentID={epiContentID} 
        />
      </header>
    </div>
  );
}

export default App;
