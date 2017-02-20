//
//  Database.h
//  MSN
//
//  Created by Arash Z. Jahangiri on 4/6/16.
//  Copyright © 2016 Arash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Database : NSObject

+ (NSString *) getDbFilePath;
+ (void)initDB;
//landing page
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
                           votingOptions:(NSArray *)votingOptions;

+ (NSArray *)selectFromLandingPageWithFilePath:(NSString *)filePath;

+(int)deleteLandingPageWithFilePath:(NSString *)filePath;
+(int)deleteLandingPageWithFilePath:(NSString *)filePath withID:(NSString *)postID;
+ (int)updateURLLandingPageTable:(NSString*)filePath;

+(void)updateLandingPageWithFilePath:(NSString *)filePath SetValue:(NSString *)value field:(NSString *)field postId:(NSString *)postId;

+ (NSArray *)selectFromLandingPageForFavoritesWithFilePath:(NSString *)filePath;
//category
+ (int)createCategoriesTable:(NSString*)filePath;
+ (int)insertIntoCategoriesWithFilePath:(NSString *)filePath
                                  catID:(NSString *)catID
                                catName:(NSString *)catName;
+ (NSArray *)selectFromCategoriesWithFilePath:(NSString *)filePath;
+(int)deleteCategoriesWithFilePath:(NSString *)filePath;

//medical section
+ (int)createMedicalSectionTable:(NSString*)filePath;
+ (int)insertIntoMedicalSectionWithFilePath:(NSString *)filePath
                                      medID:(NSString *)medID
                                    medName:(NSString *)medName
                                   priority:(NSInteger)priority;
+ (NSArray *)selectFromMedicalSectionWithFilePath:(NSString *)filePath;
+ (NSArray *)selectFromMedicalSectionWithID:(NSInteger)medicalId WithFilePath:(NSString *)filePath;
+(int)deleteMedicalSectionWithFilePath:(NSString *)filePath;

//favorite
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
                        votingOptions:(NSArray *)votingOptions;

+ (NSArray *)selectFromFavoriteWithFilePath:(NSString *)filePath;

+(int)deleteFavoriteWithFilePath:(NSString *)filePath;
+(int)deleteFavoriteWithFilePath:(NSString *)filePath withID:(NSString *)postId;
+ (int)copyLandingPageIntoFavoriteWithFilePath:(NSString *)filePath postID:(NSString *)postID;
+(int)deleteDuplicateDataLandingPageWithFilePath:(NSString *)filePath;
@end
