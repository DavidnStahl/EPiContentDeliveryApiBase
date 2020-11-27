import React, { useEffect } from 'react'
import { connect } from 'react-redux'
import { fetchStartPage} from '../../../redux'

function StartPageContainer({startPageData, fetchStartPage}) {
    useEffect(() => {        
        fetchStartPage()
     }, [])


    return startPageData.loading ? (
        <h2>Loading</h2>
    ) : startPageData.error ? (
       <h2>error</h2> 
    ) : ( <div className="text-black-50">
             <h1 class="mb-4 mt-4">{startPageData.startPage.welcomeMessage.value}</h1> 
             <div>{startPageData.startPage.mainBody.value.replace(/(<([^>]+)>)/gi, "")}</div>
         </div> )
}

const mapStateToProps = state => {    
    return {
        startPageData: state.startPage
    }
}

const mapDispatchToProps = dispatch => {
    return {
        fetchStartPage: () => dispatch(fetchStartPage())
    }
}

export default connect(
    mapStateToProps,
    mapDispatchToProps)
    (StartPageContainer)