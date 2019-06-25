import React, { Component } from "react";
import PropTypes from "prop-types";
import { compose } from "redux";
import { Link } from 'react-router-dom';
import { connect } from "react-redux";
import {
  CircularProgress,
  List,
  ListItem,
  ListItemText,
  ListItemAvatar,
  Avatar,
  Typography
} from "@material-ui/core";
import { withStyles } from "@material-ui/core/styles";
import _ from "lodash";
import { fetchOperators } from "../actions/operatorsActions";

const styles = theme => ({
  progress: {
    margin: "auto",
    marginTop: theme.spacing.unit * 4,
    width: "fit-content"
  },
  root: {
    margin: theme.spacing.unit * 3
  },
  todo: {
    marginTop: theme.spacing.unit * 4
  }
});

class Operators extends Component {
  static propTypes = {
    fetchOperators: PropTypes.func,
    operators: PropTypes.object
  };

  _isMounted = false;

  state = {
    loading: false
  };

  componentWillMount() {
    this._isMounted = true;
  }

  componentWillUnmount() {
    this._isMounted = false;
  }

  componentDidMount() {
    this.fetchOperators();
  }

  fetchOperators() {
    if (this.state.loading) return null;
    this.setState({ loading: true });
    this.props.fetchOperators().then(() => {
      this._isMounted && this.setState({ loading: false });
    });
  }

  render() {
    const { classes, operators } = this.props;
    const { loading } = this.state;
    // const id = this.props.match.params.id
    // const test = operators.find(function (operator) {
    //   return operator.id === id;
    // });
    // console.log(test)
  
    if (loading) {
      return (
        <div className={classes.progress}>
          <CircularProgress size={32} />
        </div>
      );
    }

    return (
      <div className={classes.root}>
        <List>
          {_.map(operators, operator => (
            <ListItem key={operator.id}>
              <ListItemAvatar>
                <Avatar alt={`Avatar ID ${operator.id}`} />
              </ListItemAvatar>
              <Link to={`/operators/${operator.id}`} key={operator.id}>
                <ListItemText inset primary={operator.name} />
              </Link>
                ({operator.points} points)
            </ListItem>
          ))}
        </List>
        <Typography className={classes.todo}>
          <em>
            TODO :<br />
            Lien vers dashboard personnel avec suivi des points et du nombre de
            pièces traitées suivant le jour
          </em>
        </Typography>
      </div>
    );
  }
}

const mapStateToProps = ({ operatorsReducer: operators }) => ({ operators });

export default compose(
  connect(
    mapStateToProps,
    { fetchOperators }
  ),
  withStyles(styles)
)(Operators);


//  l'idée était de chercher l'id de l'opérateur et de le retrouver ensuite dans la DB pour pouvoir 
// mettre les infos son nom + son nombre de points acquis à la journée
// J'ai cherché avec le this.props je n'ai pu récupéré que l'id 
// Mais je n'ai pas réussi à faire matcher

// import React, { Component } from "react";
// import { compose } from "redux";
// import { connect } from "react-redux";

// class OperatorShow extends Component { 

//     render() {
//     const operator = this.props.operator;
//     console.log(operator)
//       return (
//         <div>
//             <h3>Ici doit apparaître mon score du jour</h3>
//           </div>
//       );
//     }
// }


//  function mapStateToProps(state, ownProps) {
//     const id = parseInt(ownProps.match.params.id);
//     return {
//       operator: state.operators.find((operator) => operator.id === id),
//     };
//   }

//  export default OperatorShow;