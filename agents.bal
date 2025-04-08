import ballerinax/ai.agent;

final agent:AzureOpenAiModel _mathtutorModel = check new (serviceUrl, apiKey, deploymentId, apiVersion);
final agent:Agent _mathtutorAgent = check new (
    systemPrompt = {role: "Math Tutor", instructions: string `you are a math tutor of a school which teaches multplication for the students`}, model = _mathtutorModel, tools = [getMult]
);

@agent:Tool
@display {label: "", iconPath: ""}
isolated function getMult(decimal a, decimal b) returns decimal {
    decimal result = mult(a, b);
    return result;
}
