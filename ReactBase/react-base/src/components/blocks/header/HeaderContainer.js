import React, { useEffect } from 'react'
import { connect } from 'react-redux'
import { fetchHeader} from '../../../redux'
import HeaderItem from './HeaderItem'

function HeaderContainer({headerData, fetchHeader}) {
    useEffect(() => {        
        fetchHeader()
     }, [])
    
     const headerItems = headerData.header !== false? headerData.header.map(header => 
     <HeaderItem key={header.ContentGuid.toString()} header={header}/>
     ) : <h2>loading</h2>

    return headerData.loading ? (
        <h2>Loading</h2>
    ) : headerData.error ? (
       <h2>error</h2> 
    ) : (
        <nav className="navbar navbar-expand-lg navbar-dark header-navbar">
            <span></span>
            <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span className="navbar-toggler-icon"></span>
            </button>

            <div className="collapse navbar-collapse" id="navbarSupportedContent">
                <ul className="navbar-nav mr-auto">
                {headerItems}                     
                </ul>    
            </div>
      </nav>
        
    )
}

const mapStateToProps = state => {    
    return {
        headerData: state.header
    }
}

const mapDispatchToProps = dispatch => {
    return {
        fetchHeader: () => dispatch(fetchHeader())
    }
}

export default connect(
    mapStateToProps,
    mapDispatchToProps)
    (HeaderContainer)
