import React from 'react'

function headerItem(props) {


    return (
        <li className="nav-item active">
                    <a className="nav-link hoverable" href="#Home">{props.header.Name}</a>
        </li>
    )
}

export default headerItem
