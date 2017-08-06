module.exports.handler = function(event, context, callback) {
    console.log('Handling event: ', JSON.stringify(event));
    callback(null, {
        statusCode: 200,
        body: 'Success'
    });
};
