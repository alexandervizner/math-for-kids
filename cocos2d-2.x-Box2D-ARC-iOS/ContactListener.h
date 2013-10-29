//
//  ContactListener.h
//  cocos2d-2.x-Box2D-ARC-iOS
//
//  Created by alex on 3/31/13.
//
//

#import "Box2d.h"
#import <vector>
#import <algorithm>

using namespace std;

#ifndef __cocos2d_2_x_Box2D_ARC_iOS__ContactListener__
#define __cocos2d_2_x_Box2D_ARC_iOS__ContactListener__
#endif /* defined(__cocos2d_2_x_Box2D_ARC_iOS__ContactListener__) */

struct Contact {
    
    b2Fixture *fixtureA;
    b2Fixture *fixtureB;
    bool operator == (const Contact& other) const {        
        return (fixtureA == other.fixtureA) && (fixtureB == other.fixtureB);
    }
};

    class ContactListener : public b2ContactListener {        
    public:
        vector<Contact> _contacts;
        ContactListener();
        ~ContactListener();
                
        virtual void BeginContact(b2Contact* contact);
        virtual void EndContact(b2Contact* contact);
        virtual void PreSolve(b2Contact* contact, const b2Manifold* oldManifold);
        virtual void PostSolve(b2Contact* contact, const b2ContactImpulse* impulse);        
    };