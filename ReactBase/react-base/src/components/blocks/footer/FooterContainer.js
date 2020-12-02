import React, { useEffect } from 'react'
import { connect } from 'react-redux'
import { fetchFooter} from '../../../redux'

function FooterContainer({footerData, fetchFooter}) {
    useEffect(() => {        
        fetchFooter()
     }, [])
    
    
    return footerData.loading ? (
        <h2>Loading</h2>
    ) : footerData.error ? (
       <h2>error</h2> 
    ) : (
        <div className="footer">
           <p className="text-warning">{footerData.footer.Text}</p>
        </div> 
    )
}

const mapStateToProps = state => {    
    return {
        footerData: state.footer
    }
}

const mapDispatchToProps = dispatch => {
    return {
        fetchFooter: () => dispatch(fetchFooter())
    }
}

export default connect(
    mapStateToProps,
    mapDispatchToProps)
    (FooterContainer)