trigger AccountDeleteRedirect on Account (after delete) {
	RedirectApexClass.triggerAfterDelete();
}