import {useState,useEffect} from 'react'

function EpiserverHeaderComponent(props) {
    const [items, setItems] = useState([]);

    useEffect(() => {
        fetch(props.url + "/api/episerver/v2.0/content/" + props.contentID, {
            headers: {
               'Accept-Language' : ''
            }
        })
          .then(res => res.json())
          .then(
            function (result) {
              var filterHtmlMainbody = result.mainBody.value.replace(/<\/?([a-z][a-z0-9]*)\b[^>]*>/gi, '').
              replace(/&#[0-9]+;t/gi,"").replace(/\[/g,"").replace(/\]/g,"");
              console.log(filterHtmlMainbody);

               setItems(result.welcomeMessage.value,filterHtmlMainbody)

              }
          )
    }, [])

    var itemsToShow = items.array.forEach(element => {
      return <h2>{element}</h2>
    })
        return (
          {itemsToShow}
        ); 
}

export default EpiserverHeaderComponent


