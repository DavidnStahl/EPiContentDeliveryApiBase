import React,{useEffect,useState} from 'react'


function DescriptionBlockContainer(props) {
   const [title, setTitle] = useState("loading")
   const [mainBody, setMainBody] = useState("loading")
   
    useEffect(() => {
        console.log(props)
        if(props.data !== false && props.data !== undefined){
            if(props.data.title.value !== undefined){
                console.log(props.data)
                setTitle(props.data.title.value)
                setMainBody(props.data.mainBody.value)
            }
                       
        }else {
            setTitle("loading")
            setMainBody("loading")
        }        
     }, [title,mainBody,props])

    return props.data !== false?(
        <div className="mt-3 text-left container">    
           <h1 className="mb-5 mt-5">{title}</h1>   
           {<div dangerouslySetInnerHTML={{__html: mainBody}}>
           </div>}
        </div>): <h1>not working</h1>
}

export default DescriptionBlockContainer

