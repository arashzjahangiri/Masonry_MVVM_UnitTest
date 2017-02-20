//
//  Database.m
//  MSN
//
//  Created by Arash Z. Jahangiri on 4/6/16.
//  Copyright © 2016 Arash. All rights reserved.
//

#import "Database.h"

@implementation Database

+ (NSString *) getDbFilePath
{
    NSString * docsPath= NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@", [docsPath stringByAppendingPathComponent:@"MSN.db"]);
    return [docsPath stringByAppendingPathComponent:@"MSN.db"];
}

+ (void)initDB{
    if(![[NSFileManager defaultManager] fileExistsAtPath:[self getDbFilePath]]) //if the file does not exist
    {
        [self createLandingPageTable:[self getDbFilePath]];
        [self createCategoriesTable:[self getDbFilePath]];
        [self createMedicalSectionTable:[self getDbFilePath]];
        [self createFavoriteTable:[self getDbFilePath]];
    }
}

# pragma mark creat method table

+ (int)createLandingPageTable:(NSString*)filePath
{
    sqlite3* db = NULL;
    int rc=0;
    
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        char * query ="CREATE TABLE IF NOT EXISTS LandingPage (ID INTEGER PRIMARY KEY AUTOINCREMENT, postID text, title text, content text,contentSummary text,contentHTML text, imageUrl text, publish_date text, categoryId text, categoryName text, userAvatarUrl text, userTitle text, userJobTitle text, userPageId text, userEntity text, userEntityId text, likes_count text, recommends_count text, favorites_count text, liked text, favorite text, recommended text, tags text, postType text, audioUrl text, videoUrl text, audioSize integer, videoSize integer, videoSnapshot text, votingOptions text)";
        char * errMsg;
        rc = sqlite3_exec(db, query,NULL,NULL,&errMsg);
        
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to create table rc:%d, msg=%s",rc,errMsg);
        }
        
        //NSLog(@"create LandingPage");
        sqlite3_close(db);
    }
    return rc;
}

+ (int)createFavoriteTable:(NSString*)filePath
{
    sqlite3* db = NULL;
    int rc=0;
    
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        char * query ="CREATE TABLE IF NOT EXISTS Favorite (ID INTEGER PRIMARY KEY AUTOINCREMENT, postID text, title text, content text,contentSummary text,contentHTML text, imageUrl text, publish_date text, categoryId text, categoryName text, userAvatarUrl text, userTitle text, userJobTitle text, userPageId text, userEntity text, userEntityId text, likes_count text, recommends_count text, favorites_count text, liked text, favorite text, recommended text, tags text, postType text, audioUrl text, videoUrl text, audioSize integer, videoSize integer, videoSnapshot, votingOptions text)";
        char * errMsg;
        rc = sqlite3_exec(db, query,NULL,NULL,&errMsg);
        
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to create table rc:%d, msg=%s",rc,errMsg);
        }
        
        //NSLog(@"create LandingPage");
        sqlite3_close(db);
    }
    return rc;
}

+ (int)createCategoriesTable:(NSString*)filePath
{
    sqlite3* db = NULL;
    int rc=0;
    
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        char * query ="CREATE TABLE IF NOT EXISTS Categories (ID INTEGER PRIMARY KEY AUTOINCREMENT, catId text, catName text)";
        char * errMsg;
        rc = sqlite3_exec(db, query,NULL,NULL,&errMsg);
        
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to create table rc:%d, msg=%s",rc,errMsg);
        }
        
        //NSLog(@"create Categories");
        sqlite3_close(db);
    }
    return rc;
}

+ (int)createMedicalSectionTable:(NSString*)filePath{
    sqlite3* db = NULL;
    int rc=0;
    
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        char * query ="CREATE TABLE IF NOT EXISTS MedicalSection (ID INTEGER PRIMARY KEY AUTOINCREMENT, MedId text, MedName text, priority INTEGER)";
        char * errMsg;
        rc = sqlite3_exec(db, query,NULL,NULL,&errMsg);
        
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to create table rc:%d, msg=%s",rc,errMsg);
        }
        
        //NSLog(@"create Medical section");
        sqlite3_close(db);
    }
    return rc;
    
}

+ (int)updateURLLandingPageTable:(NSString*)filePath
{
    sqlite3* db = NULL;
    int rc=0;
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        char * query ="UPDATE landingpage SET imageUrl = replace( imageUrl, 'http://213.233.175.250:8081/', 'http://abresalamat.ir/' ) WHERE postType != \"video\"";
        char * errMsg;
        rc = sqlite3_exec(db, query,NULL,NULL,&errMsg);
        
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to create table rc:%d, msg=%s",rc,errMsg);
        }
        
        //NSLog(@"create LandingPage");
        sqlite3_close(db);
    }
    return rc;
}

#pragma mark insert into table method

+ (int)insertIntoLandingPageWithFilePath:(NSString *)filePath
                                  postID:(NSString *)postID
                                   title:(NSString *)title
                                 content:(NSString *)content
                                 contentSummary:(NSString *)contentSummary
                                 contentHTML:(NSString *)contentHTML
                                imageUrl:(NSString *)imageUrl
                            publish_date:(NSString *)publish_date
                              categoryId:(NSString *)categoryId
                            categoryName:(NSString *)categoryName
                           userAvatarUrl:(NSString *)userAvatarUrl
                               userTitle:(NSString *)userTitle
                            userJobTitle:(NSString *)userJobTitle
                              userPageId:(NSString *)userPageId
                              userEntity:(NSString *)userEntity
                            userEntityId:(NSString *)userEntityId
                             likes_count:(NSString *)likes_count
                        recommends_count:(NSString *)recommends_count
                         favorites_count:(NSString *)favorites_count
                                   liked:(NSString *)liked
                                favorite:(NSString *)favorite
                             recommended:(NSString *)recommended
                                    tags:(NSArray *)tags
                                postType:(NSString *)postType
                                audioUrl:(NSString *)audioUrl
                                videoUrl:(NSString *)videoUrl
                               audioSize:(NSInteger)audioSize
                               videoSize:(NSInteger)videoSize
                                videoSnapShot:(NSString *)videoSnapshot
                           votingOptions:(NSArray *)votingOptions{
    NSMutableString *tagsStr = [[NSMutableString alloc]init];
    NSMutableString *optionsStr = [[NSMutableString alloc]init];
    for (NSDictionary *dic in tags) {
        [tagsStr appendString:[NSString stringWithFormat:@"%@,",[dic objectForKey:@"id"]]];
        [tagsStr appendString:[NSString stringWithFormat:@"%@,,,",[dic objectForKey:@"name"]]];
    }
    for (NSDictionary *dic in votingOptions) {
        //[tagsStr appendString:[NSString stringWithFormat:@"%@,",[dic objectForKey:@"id"]]];
        [optionsStr appendString:[NSString stringWithFormat:@"%@,",[dic objectForKey:@"text"]]];
        [optionsStr appendString:[NSString stringWithFormat:@"%@,",[dic objectForKey:@"answered"]]];
        [optionsStr appendString:[NSString stringWithFormat:@"%@,,,",[dic objectForKey:@"answers_percent"]]];
    }
    sqlite3* db = NULL;
    int rc=0;
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString * query  = [NSString
                             stringWithFormat:@"INSERT INTO LandingPage(postID, title, content, contentSummary, contentHTML, imageUrl, publish_date, categoryId, categoryName, userAvatarUrl, userTitle, userJobTitle, userPageId, userEntity, userEntityId, likes_count, recommends_count, favorites_count, liked, favorite, recommended, tags, postType, audioUrl, videoUrl, audioSize, videoSize, videoSnapshot, votingOptions) VALUES (\"%@\",\"%@\",\"%@\",\"%@\", \"%@\",\"%@\",\"%@\",\"%@\",\"%@\",\"%@\" ,\"%@\",\"%@\",\"%@\",\"%@\", \"%@\",\"%@\" ,\"%@\",\"%@\" ,\"%@\",\"%@\",\"%@\" ,\'%@\',\"%@\",\"%@\",\"%@\",\'%ld\',\'%ld\',\"%@\",\"%@\")", postID, title, content, contentSummary, contentHTML, imageUrl, publish_date, categoryId, categoryName, userAvatarUrl, userTitle, userJobTitle, userPageId, userEntity, userEntityId, likes_count, recommends_count, favorites_count, liked, favorite, recommended, tagsStr, postType, audioUrl, videoUrl, (long)audioSize, (long)videoSize, videoSnapshot, optionsStr];
        
        char * errMsg;
        rc = sqlite3_exec(db, [query UTF8String] ,NULL,NULL,&errMsg);
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to insert record  rc:%d, msg=%s",rc,errMsg);
        }
        
        sqlite3_close(db);
    }
    return rc;
    
}

+ (int)insertIntoFavoriteWithFilePath:(NSString *)filePath
                                  postID:(NSString *)postID
                                   title:(NSString *)title
                                 content:(NSString *)content
                                imageUrl:(NSString *)imageUrl
                            publish_date:(NSString *)publish_date
                              categoryId:(NSString *)categoryId
                            categoryName:(NSString *)categoryName
                           userAvatarUrl:(NSString *)userAvatarUrl
                               userTitle:(NSString *)userTitle
                            userJobTitle:(NSString *)userJobTitle
                              userPageId:(NSString *)userPageId
                              userEntity:(NSString *)userEntity
                            userEntityId:(NSString *)userEntityId
                             likes_count:(NSString *)likes_count
                        recommends_count:(NSString *)recommends_count
                         favorites_count:(NSString *)favorites_count
                                   liked:(NSString *)liked
                                favorite:(NSString *)favorite
                             recommended:(NSString *)recommended
                                    tags:(NSArray *)tags
                                postType:(NSString *)postType
                                audioUrl:(NSString *)audioUrl
                                videoUrl:(NSString *)videoUrl
                               audioSize:(NSInteger)audioSize
                            videoSize:(NSInteger)videoSize
                        videoSnapShot:(NSString *)videoSnapshot
                        votingOptions:(NSArray *)votingOptions{
    NSMutableString *tagsStr = [[NSMutableString alloc]init];
    NSMutableString *optionsStr = [[NSMutableString alloc]init];
    for (NSDictionary *dic in tags) {
        [tagsStr appendString:[NSString stringWithFormat:@"%@,",[dic objectForKey:@"id"]]];
        [tagsStr appendString:[NSString stringWithFormat:@"%@,,,",[dic objectForKey:@"name"]]];
    }
    for (NSDictionary *dic in votingOptions) {
        //[tagsStr appendString:[NSString stringWithFormat:@"%@,",[dic objectForKey:@"id"]]];
        [optionsStr appendString:[NSString stringWithFormat:@"%@,",[dic objectForKey:@"text"]]];
    }
    sqlite3* db = NULL;
    int rc=0;
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString * query  = [NSString
                             stringWithFormat:@"INSERT INTO Favorite(postID, title, content, imageUrl, publish_date, categoryId, categoryName, userAvatarUrl, userTitle, userJobTitle, userPageId, userEntity, userEntityId, likes_count, recommends_count, favorites_count, liked, favorite, recommended, tags, postType, audioUrl, videoUrl, audioSize, videoSize, videoSnapshot, votingOptions) VALUES (\"%@\",\"%@\",\"%@\",\"%@\", \"%@\",\"%@\",\"%@\",\"%@\" ,\"%@\",\"%@\",\"%@\",\"%@\", \"%@\",\"%@\" ,\"%@\",\"%@\" ,\"%@\",\"%@\",\"%@\" ,\'%@\',\"%@\",\"%@\",\"%@\",\'%ld\',\'%ld\',\"%@\",\"%@\")", postID, title, content, imageUrl, publish_date, categoryId, categoryName, userAvatarUrl, userTitle, userJobTitle, userPageId, userEntity, userEntityId, likes_count, recommends_count, favorites_count, liked, favorite, recommended, tagsStr, postType, audioUrl, videoUrl, (long)audioSize, (long)videoSize,videoSnapshot, optionsStr];
        
        char * errMsg;
        rc = sqlite3_exec(db, [query UTF8String] ,NULL,NULL,&errMsg);
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to insert record  rc:%d, msg=%s",rc,errMsg);
        }
        
        sqlite3_close(db);
    }
    return rc;
    
}

+ (int)copyLandingPageIntoFavoriteWithFilePath:(NSString *)filePath postID:(NSString *)postID{
    sqlite3* db = NULL;
    int rc=0;
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString * query  = [NSString
                             stringWithFormat:@"INSERT INTO Favorite SELECT * FROM LandingPage where LandingPage.postID NOT IN (SELECT Favorite.postID from Favorite) AND LandingPage.postID = \"%@\"", postID];
        
        char * errMsg;
        rc = sqlite3_exec(db, [query UTF8String] ,NULL,NULL,&errMsg);
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to insert record  rc:%d, msg=%s",rc,errMsg);
        }
        
        sqlite3_close(db);
    }
    return rc;
    
}

+ (int)insertIntoCategoriesWithFilePath:(NSString *)filePath
                                  catID:(NSString *)catID
                                catName:(NSString *)catName{
    sqlite3* db = NULL;
    int rc=0;
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString * query  = [NSString
                             stringWithFormat:@"INSERT INTO Categories(catId, catName) VALUES (\"%@\",\"%@\")", catID, catName];
        
        char * errMsg;
        rc = sqlite3_exec(db, [query UTF8String] ,NULL,NULL,&errMsg);
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to insert record  rc:%d, msg=%s",rc,errMsg);
        }
        
        sqlite3_close(db);
    }
    return rc;
    
}

+ (int)insertIntoMedicalSectionWithFilePath:(NSString *)filePath
                                      medID:(NSString *)medID
                                    medName:(NSString *)medName
                                   priority:(NSInteger)priority{
    //NSLog(@"%@", medID);
    sqlite3* db = NULL;
    int rc=0;
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString * query  = [NSString
                             stringWithFormat:@"INSERT INTO MedicalSection(MedId, MedName, priority) VALUES (\"%@\",\"%@\",\"%ld\")", medID, medName, (long)priority];
        
        char * errMsg;
        rc = sqlite3_exec(db, [query UTF8String] ,NULL,NULL,&errMsg);
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to insert record  rc:%d, msg=%s",rc,errMsg);
        }
        
        sqlite3_close(db);
    }
    return rc;
    
}

#pragma mark - select

+ (NSArray *)selectFromLandingPageWithFilePath:(NSString *)filePath{
    
    NSMutableArray *posts =[[NSMutableArray alloc] init];
    sqlite3* db = NULL;
    sqlite3_stmt* stmt =NULL;
    
    int rc=0;
    rc = sqlite3_open_v2([filePath UTF8String], &db, SQLITE_OPEN_READONLY , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString  * query = @"SELECT * from LandingPage order by publish_date desc";
        
        rc =sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
        if(rc == SQLITE_OK)
        {
            while (sqlite3_step(stmt) == SQLITE_ROW) //get each row in loop
            {
                /*(postID INTEGER, title text, content text, imageUrl text, publish_date text, categoryId INTEGER, categoryName text, userAvatarUrl text, userTitle text, userJobTitle text, userPageId INTEGER, userEntity text, userEntityId INTEGER, likes_count INTEGER, recommends_count INTEGER, favorites_count INTEGER, liked text, favorite text, recommended text, tags text)
                 */
                NSString *postId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
                NSString *title =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
                NSString *content =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
                NSString *contentSummary =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
                NSString *contentHTML =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
                NSString *imageUrl =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 6)];
                NSString *publish_date =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 7)];
                NSString *categoryId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 8)];
                NSString *categoryName =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 9)];
                NSString *userAvatarUrl =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 10)];
                NSString *userTitle =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 11)];
                NSString *userJobTitle =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 12)];
                NSString *userPageId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 13)];
                NSString *userEntity =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 14)];
                NSString *userEntityId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 15)];
                NSString *likes_count =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 16)];
                NSString *recommends_count =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 17)];
                NSString *favorites_count =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 18)];
                NSString *liked =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 19)];
                NSString *favorite =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 20)];
                NSString *recommended =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 21)];
                NSString *tags =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 22)];
                NSString *postType =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 23)];
                NSString *audioUrl =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 24)];
                NSString *videoUrl =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 25)];
                NSInteger audioSize =[[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 26)]integerValue];
                NSInteger videoSize =[[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 27)]integerValue];
                NSString *videoSnapshot =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 28)];
                NSString *votingOptions =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 29)];
                NSDictionary *post =[NSDictionary dictionaryWithObjectsAndKeys:postId, @"postId", title, @"title", content, @"content", contentSummary, @"content_summary", contentHTML, @"content_html", imageUrl, @"imageUrl", publish_date, @"publish_date", categoryId, @"categoryId", categoryName, @"categoryName", userAvatarUrl, @"userAvatarUrl", userTitle, @"userTitle", userJobTitle, @"userJobTitle", userPageId, @"userPageId", userEntity, @"userEntity",userEntityId, @"userEntityId", likes_count, @"likesCount", recommends_count, @"recommendsCount", favorites_count,@"favoritesCount",liked, @"liked",favorite, @"favorite", recommended, @"recommended", tags, @"tags", postType, @"postType", audioUrl, @"audioUrl", videoUrl, @"videoUrl", [NSNumber numberWithInteger:audioSize], @"audioSize", [NSNumber numberWithInteger:videoSize], @"videoSize", videoSnapshot, @"videoSnapshot", votingOptions, @"votingOptions", nil];
                
                
                [posts addObject:post];
            }
            //NSLog(@"Done");
            sqlite3_finalize(stmt);
        }
        else
        {
            //NSLog(@"Failed to prepare statement with rc:%d",rc);
        }
        sqlite3_close(db);
    }
    
    return posts;
}

+ (NSArray *)selectFromFavoriteWithFilePath:(NSString *)filePath{
    
    NSMutableArray *posts =[[NSMutableArray alloc] init];
    sqlite3* db = NULL;
    sqlite3_stmt* stmt =NULL;
    
    int rc=0;
    rc = sqlite3_open_v2([filePath UTF8String], &db, SQLITE_OPEN_READONLY , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString  * query = @"SELECT * from Favorite";
        
        rc =sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
        if(rc == SQLITE_OK)
        {
            while (sqlite3_step(stmt) == SQLITE_ROW) //get each row in loop
            {
                /*(postID INTEGER, title text, content text, imageUrl text, publish_date text, categoryId INTEGER, categoryName text, userAvatarUrl text, userTitle text, userJobTitle text, userPageId INTEGER, userEntity text, userEntityId INTEGER, likes_count INTEGER, recommends_count INTEGER, favorites_count INTEGER, liked text, favorite text, recommended text, tags text)
                 */
                NSString *postId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
                NSString *title =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
                NSString *content =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
                NSString *contentSummary =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
                NSString *contentHTML =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
                NSString *imageUrl =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 6)];
                NSString *publish_date =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 7)];
                NSString *categoryId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 8)];
                NSString *categoryName =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 9)];
                NSString *userAvatarUrl =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 10)];
                NSString *userTitle =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 11)];
                NSString *userJobTitle =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 12)];
                NSString *userPageId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 13)];
                NSString *userEntity =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 14)];
                NSString *userEntityId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 15)];
                NSString *likes_count =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 16)];
                NSString *recommends_count =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 17)];
                NSString *favorites_count =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 18)];
                NSString *liked =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 19)];
                NSString *favorite =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 20)];
                NSString *recommended =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 21)];
                NSString *tags =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 22)];
                NSString *postType =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 23)];
                NSString *audioUrl =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 24)];
                NSString *videoUrl =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 25)];
                NSInteger audioSize =[[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 26)]integerValue];
                NSInteger videoSize =[[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 27)]integerValue];
                NSString *videoSnapshot =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 28)];
                NSString *votingOptions =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 29)];
                NSDictionary *post =[NSDictionary dictionaryWithObjectsAndKeys:postId, @"postId", title, @"title", content, @"content", contentSummary, @"content_summary", contentHTML, @"content_html", imageUrl, @"imageUrl", publish_date, @"publish_date", categoryId, @"categoryId", categoryName, @"categoryName", userAvatarUrl, @"userAvatarUrl", userTitle, @"userTitle", userJobTitle, @"userJobTitle", userPageId, @"userPageId", userEntity, @"userEntity",userEntityId, @"userEntityId", likes_count, @"likesCount", recommends_count, @"recommendsCount", favorites_count,@"favoritesCount",liked, @"liked",favorite, @"favorite", recommended, @"recommended", tags, @"tags", postType, @"postType", audioUrl, @"audioUrl", videoUrl, @"videoUrl", [NSNumber numberWithInteger:audioSize], @"audioSize", [NSNumber numberWithInteger:videoSize], @"videoSize", videoSnapshot, @"videoSnapshot", votingOptions, @"votingOptions", nil];
                
                
                [posts addObject:post];
            }
            //NSLog(@"Done");
            sqlite3_finalize(stmt);
        }
        else
        {
            //NSLog(@"Failed to prepare statement with rc:%d",rc);
        }
        sqlite3_close(db);
    }
    
    return posts;
}

+ (NSArray *)selectFromCategoriesWithFilePath:(NSString *)filePath{
    
    NSMutableArray *categories =[[NSMutableArray alloc] init];
    sqlite3* db = NULL;
    sqlite3_stmt* stmt =NULL;
    
    int rc=0;
    rc = sqlite3_open_v2([filePath UTF8String], &db, SQLITE_OPEN_READONLY , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString  * query = @"SELECT * from Categories";
        
        rc =sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
        if(rc == SQLITE_OK)
        {
            while (sqlite3_step(stmt) == SQLITE_ROW) //get each row in loop
            {
                /*(postID INTEGER, title text, content text, imageUrl text, publish_date text, categoryId INTEGER, categoryName text, userAvatarUrl text, userTitle text, userJobTitle text, userPageId INTEGER, userEntity text, userEntityId INTEGER, likes_count INTEGER, recommends_count INTEGER, favorites_count INTEGER, liked text, favorite text, recommended text, tags text)
                 */
                NSString *catId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
                NSString *catName =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
                NSDictionary *category =[NSDictionary dictionaryWithObjectsAndKeys:catId, @"Id", catName, @"name", nil];
                [categories addObject:category];
            }
            //NSLog(@"Done");
            sqlite3_finalize(stmt);
        }
        else
        {
            //NSLog(@"Failed to prepare statement with rc:%d",rc);
        }
        sqlite3_close(db);
    }
    
    return categories;
}

+ (NSArray *)selectFromMedicalSectionWithFilePath:(NSString *)filePath{
    NSMutableArray *medicalSections =[[NSMutableArray alloc] init];
    sqlite3* db = NULL;
    sqlite3_stmt* stmt =NULL;
    
    int rc=0;
    rc = sqlite3_open_v2([filePath UTF8String], &db, SQLITE_OPEN_READONLY , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString  * query = @"SELECT * from MedicalSection";
        
        rc =sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
        if(rc == SQLITE_OK)
        {
            while (sqlite3_step(stmt) == SQLITE_ROW) //get each row in loop
            {
                /*(postID INTEGER, title text, content text, imageUrl text, publish_date text, categoryId INTEGER, categoryName text, userAvatarUrl text, userTitle text, userJobTitle text, userPageId INTEGER, userEntity text, userEntityId INTEGER, likes_count INTEGER, recommends_count INTEGER, favorites_count INTEGER, liked text, favorite text, recommended text, tags text)
                 */
                NSString *medId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
                NSString *medName =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
                NSString *priority =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
                NSDictionary *medicalSection =[NSDictionary dictionaryWithObjectsAndKeys:medId, @"Id", medName, @"name", priority, @"priority", nil];
                [medicalSections addObject:medicalSection];
            }
            //NSLog(@"Done");
            sqlite3_finalize(stmt);
        }
        else
        {
            //NSLog(@"Failed to prepare statement with rc:%d",rc);
        }
        sqlite3_close(db);
    }
    
    return medicalSections;
    
}

+ (NSArray *)selectFromMedicalSectionWithID:(NSInteger)medicalId WithFilePath:(NSString *)filePath{
    NSMutableArray *medicalSections =[[NSMutableArray alloc] init];
    sqlite3* db = NULL;
    sqlite3_stmt* stmt =NULL;
    
    int rc=0;
    rc = sqlite3_open_v2([filePath UTF8String], &db, SQLITE_OPEN_READONLY , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString  * query = [NSString stringWithFormat:@"SELECT * from MedicalSection where MedId = %ld", (long)medicalId];
        
        rc =sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
        if(rc == SQLITE_OK)
        {
            while (sqlite3_step(stmt) == SQLITE_ROW) //get each row in loop
            {
                /*(postID INTEGER, title text, content text, imageUrl text, publish_date text, categoryId INTEGER, categoryName text, userAvatarUrl text, userTitle text, userJobTitle text, userPageId INTEGER, userEntity text, userEntityId INTEGER, likes_count INTEGER, recommends_count INTEGER, favorites_count INTEGER, liked text, favorite text, recommended text, tags text)
                 */
                NSString *medId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
                NSString *medName =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
                NSString *priority =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
                NSDictionary *medicalSection =[NSDictionary dictionaryWithObjectsAndKeys:medId, @"Id", medName, @"name", priority, @"priority", nil];
                [medicalSections addObject:medicalSection];
            }
            //NSLog(@"Done");
            sqlite3_finalize(stmt);
        }
        else
        {
            //NSLog(@"Failed to prepare statement with rc:%d",rc);
        }
        sqlite3_close(db);
    }
    
    return medicalSections;

}

+ (NSArray *)selectFromLandingPageForFavoritesWithFilePath:(NSString *)filePath{
    NSMutableArray *posts =[[NSMutableArray alloc] init];
    sqlite3* db = NULL;
    sqlite3_stmt* stmt =NULL;
    
    int rc=0;
    rc = sqlite3_open_v2([filePath UTF8String], &db, SQLITE_OPEN_READONLY , NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString  * query = @"SELECT * from LandingPage where favorite = 1";
        
        rc =sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
        if(rc == SQLITE_OK)
        {
            while (sqlite3_step(stmt) == SQLITE_ROW) //get each row in loop
            {
                /*(postID INTEGER, title text, content text, imageUrl text, publish_date text, categoryId INTEGER, categoryName text, userAvatarUrl text, userTitle text, userJobTitle text, userPageId INTEGER, userEntity text, userEntityId INTEGER, likes_count INTEGER, recommends_count INTEGER, favorites_count INTEGER, liked text, favorite text, recommended text, tags text)
                 */
                NSString *postId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
                NSString *title =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 2)];
                NSString *content =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 3)];
                NSString *imageUrl =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 4)];
                NSString *publish_date =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 5)];
                NSString *categoryId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 6)];
                NSString *categoryName =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 7)];
                NSString *userAvatarUrl =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 8)];
                NSString *userTitle =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 9)];
                NSString *userJobTitle =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 10)];
                NSString *userPageId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 11)];
                NSString *userEntity =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 12)];
                NSString *userEntityId =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 13)];
                NSString *likes_count =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 14)];
                NSString *recommends_count =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 15)];
                NSString *favorites_count =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 16)];
                NSString *liked =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 17)];
                NSString *favorite =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 18)];
                NSString *recommended =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 19)];
                NSString *tags =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 20)];
                NSString *postType =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 21)];
                NSString *audioUrl =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 22)];
                NSString *videoUrl =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 23)];
                NSInteger audioSize =[[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 24)]integerValue];
                NSInteger videoSize =[[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 25)]integerValue];
                NSString *videoSnapshot =[NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 26)];
                NSDictionary *post =[NSDictionary dictionaryWithObjectsAndKeys:postId, @"postId", title, @"title", content, @"content", imageUrl, @"imageUrl", publish_date, @"publish_date", categoryId, @"categoryId", categoryName, @"categoryName", userAvatarUrl, @"userAvatarUrl", userTitle, @"userTitle", userJobTitle, @"userJobTitle", userPageId, @"userPageId", userEntity, @"userEntity",userEntityId, @"userEntityId", likes_count, @"likesCount", recommends_count, @"recommendsCount", favorites_count,@"favoritesCount",liked, @"liked",favorite, @"favorite", recommended, @"recommended", tags, @"tags", postType, @"postType", audioUrl, @"audioUrl", videoUrl, @"videoUrl", [NSNumber numberWithInteger:audioSize], @"audioSize", [NSNumber numberWithInteger:videoSize], @"videoSize", videoSnapshot, @"videoSnapshot", nil];
                
                
                [posts addObject:post];
            }
            //NSLog(@"Done");
            sqlite3_finalize(stmt);
        }
        else
        {
            //NSLog(@"Failed to prepare statement with rc:%d",rc);
        }
        sqlite3_close(db);
    }
    
    return posts;

}

#pragma mark - delete
+(int)deleteDuplicateDataLandingPageWithFilePath:(NSString *)filePath{
    /*
     delete   from landingpage
     where    rowid not in
     (
     select  min(rowid)
     from    landingpage
     group by
     postid
     )
     */
    sqlite3* db = NULL;
    int rc=0;
    
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        char * query ="delete from landingpage where rowid not in (select  min(rowid) from landingpage group by postid)";
        char * errMsg;
        rc = sqlite3_exec(db, query,NULL,NULL,&errMsg);
        
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to delete data rc:%d, msg=%s",rc,errMsg);
        }
        
        //NSLog(@"delete successful");
        sqlite3_close(db);
    }
    
    return rc;
    
}

+(int)deleteLandingPageWithFilePath:(NSString *)filePath{
    
    sqlite3* db = NULL;
    int rc=0;
    
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        char * query ="delete  froM LandingPage";
        char * errMsg;
        rc = sqlite3_exec(db, query,NULL,NULL,&errMsg);
        
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to delete data rc:%d, msg=%s",rc,errMsg);
        }
        
        //NSLog(@"delete successful");
        sqlite3_close(db);
    }
    
    return rc;
    
}

+(int)deleteLandingPageWithFilePath:(NSString *)filePath withID:(NSString *)postID{
    
    sqlite3* db = NULL;
    int rc=0;
    
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString *query =[NSString stringWithFormat:@"delete froM Landingpage where postID = \"%@\"", postID];
        char * errMsg;
        rc = sqlite3_exec(db, [query UTF8String] ,NULL,NULL,&errMsg);
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to insert record  rc:%d, msg=%s",rc,errMsg);
        }
        
        sqlite3_close(db);
    }
    return rc;
}

+(int)deleteFavoriteWithFilePath:(NSString *)filePath{
    
    sqlite3* db = NULL;
    int rc=0;
    
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        char * query ="delete  froM Favorite";
        char * errMsg;
        rc = sqlite3_exec(db, query,NULL,NULL,&errMsg);
        
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to delete data rc:%d, msg=%s",rc,errMsg);
        }
        
        //NSLog(@"delete successful");
        sqlite3_close(db);
    }
    
    return rc;
    
}

+(int)deleteFavoriteWithFilePath:(NSString *)filePath withID:(NSString *)postId{
    
    sqlite3* db = NULL;
    int rc=0;
    
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString *query =[NSString stringWithFormat:@"delete froM Favorite where postID = \"%@\"", postId];
        char * errMsg;
        rc = sqlite3_exec(db, [query UTF8String] ,NULL,NULL,&errMsg);
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to insert record  rc:%d, msg=%s",rc,errMsg);
        }
        
        sqlite3_close(db);
    }
    return rc;
}

+(int)deleteCategoriesWithFilePath:(NSString *)filePath{
    
    sqlite3* db = NULL;
    int rc=0;
    
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        char * query ="delete  from Categories";
        char * errMsg;
        rc = sqlite3_exec(db, query,NULL,NULL,&errMsg);
        
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to delete data rc:%d, msg=%s",rc,errMsg);
        }
        
        //NSLog(@"delete successful");
        sqlite3_close(db);
    }
    
    return rc;
    
}

+(int)deleteMedicalSectionWithFilePath:(NSString *)filePath{
    sqlite3* db = NULL;
    int rc=0;
    
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        char * query ="delete from MedicalSection";
        char * errMsg;
        rc = sqlite3_exec(db, query,NULL,NULL,&errMsg);
        
        if(SQLITE_OK != rc)
        {
            //NSLog(@"Failed to delete data rc:%d, msg=%s",rc,errMsg);
        }
        
        //NSLog(@"delete successful");
        sqlite3_close(db);
    }
    
    return rc;
}

#pragma mark - update

+(void)updateLandingPageWithFilePath:(NSString *)filePath SetValue:(NSString *)value field:(NSString *)field postId:(NSString *)postId{
    
    sqlite3* db = NULL;
    int rc=0;
    sqlite3_stmt* stmt =NULL;
    
    
    rc = sqlite3_open_v2([filePath cStringUsingEncoding:NSUTF8StringEncoding], &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, NULL);
    if (SQLITE_OK != rc)
    {
        sqlite3_close(db);
        //NSLog(@"Failed to open db connection");
    }
    else
    {
        NSString *tempQuery =[NSString stringWithFormat:@"update landingpage SET %@ = \"%@\" where postid = \"%@\"",field, value, postId];
        NSString  *query = tempQuery;
        
        rc =sqlite3_prepare_v2(db, [query UTF8String], -1, &stmt, NULL);
        if(rc == SQLITE_OK)        {
            sqlite3_bind_text(stmt, 12, [@"YES" UTF8String], -1, SQLITE_TRANSIENT);
            char* errmsg;
            sqlite3_exec(db, "COMMIT", NULL, NULL, &errmsg);
            
            if(SQLITE_OK == sqlite3_step(stmt)){
                //NSLog(@"Failed to prepare statement with rc:%d",rc);
                
                
            }else {
                sqlite3_finalize(stmt);
                
                //NSLog(@"Done");
            }
        }else
        {
            //NSLog(@"Failed to prepare statement with rc:%d",rc);
            
        }
        sqlite3_close(db);
    }
    
}

@end
