
#import "ContactListener.h"

ContactListener::ContactListener(): _contacts() {}

ContactListener::~ContactListener() {}

void ContactListener::BeginContact(b2Contact* contact) {
    // We need to copy the data because b2Contact is reused.
    Contact brContact = { contact->GetFixtureA(), contact->GetFixtureB() };
    _contacts.push_back(brContact);
}

void ContactListener::EndContact(b2Contact* contact) {
    Contact brContact = { contact->GetFixtureA(), contact->GetFixtureB() };
    vector<Contact>::iterator pos;
    pos = find(_contacts.begin(), _contacts.end(), brContact);
    if (pos != _contacts.end()) { _contacts.erase(pos);}
}

void ContactListener::PreSolve(b2Contact* contact, const b2Manifold* oldManifold) {}

void ContactListener::PostSolve(b2Contact* contact, const b2ContactImpulse* impulse) {}