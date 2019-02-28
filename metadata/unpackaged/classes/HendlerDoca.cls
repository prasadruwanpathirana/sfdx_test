public with sharing class HendlerDoca implements BotHandler {
    
    public BotResponse handle(String utterance, String[] params, Map<String, String> session) {
        return new BotResponse(new BotMessage('Bot', 'Who is this fucker..! pissu huththek ne..!'));
    }
    
}