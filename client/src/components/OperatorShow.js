import React, { Component } from "react";
import { compose } from "redux";
import { connect } from "react-redux";

class OperatorShow extends Component { 

    render() {
    const operator = this.props.operator;
    console.log(operator)
     return (
       <div>
           <h3>Ici doit apparaître mon score du jour</h3>
        </div>
    );
    }
 }

//  l'idée était de chercher l'id de l'opérateur et de le retrouver ensuite dans la DB pour pouvoir 
// mettre les infos son nom + son nombre de points acquis à la journée
// J'ai cherché avec le this.props je n'ai pu récupéré que l'id 
// Mais je n'ai pas réussi à faire matcher

 function mapStateToProps(state, ownProps) {
    const id = parseInt(ownProps.match.params.id);
    return {
      operator: state.operators.find((operator) => operator.id === id),
    };
  }

 export default compose(
   connect(
     mapStateToProps,
   ),
 )(OperatorShow);