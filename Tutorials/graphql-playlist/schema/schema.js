const graphql = require('graphql');

// We will store GraphQLObjectType variable from graphql fiile
const {GraphQLObjectType, graphQLString} = graphql;

const BookType = new GraphQLObjectType({
    name: 'Book',
    fields: () => ({
        id: {type: graphQLString},
        name: {type: GraphQLString },
        genre: {type: GraphQLString}
    })
});