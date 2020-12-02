import React from 'react'
import {NavLink} from 'react-router-dom'

function headerItem(props) {
    
    const navLinkRef = () =>{        
            return `/${props.header.Name}`
    } 

    return (
        <li className="nav-item active">
        <NavLink className="nav-link hoverable text-warning" to={navLinkRef} >{props.header.Name}</NavLink>
        </li>
    )
}

export default headerItem
